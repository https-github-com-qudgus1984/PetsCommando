//
//  CommentSheetPresentationViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation
import RxSwift
import RxCocoa

protocol postCommentDelegate {
    func sendPostComment(postId: Int)
}

final class CommentSheetPresentationViewModel: ViewModelType {
    
    weak var coordinator: TabmanCoordinator?
    private var communityUseCase: CommunityUseCase
    private var dailyPostId: Int
    var postCommentDelegate: postCommentDelegate?
    
    init(coordinator: TabmanCoordinator?, communityUseCase: CommunityUseCase, dailyPostId: Int) {
        self.coordinator = coordinator
        self.communityUseCase = communityUseCase
        self.dailyPostId = dailyPostId
    }
    
    var disposeBag = DisposeBag()
    
    let commentList = PublishRelay<[Comment?]>()
    let postComment = PublishRelay<Comment>()
    
    struct Input {
        let viewDidLoad: PublishRelay<Void>
        let registerButtonTap: Signal<String>
    }
    
    struct Output {
        let commentList: PublishRelay<[Comment?]>
    }
    
    func transform(_ input: Input) -> Output {
        
        input.viewDidLoad
            .withUnretained(self)
            .bind { vc, _ in
                vc.getReviewList(postId: vc.dailyPostId)
            }
            .disposed(by: disposeBag)
        
        input.registerButtonTap
            .withUnretained(self)
            .emit { vc, text in
                vc.postReview(postId: vc.dailyPostId, content: text)
            }
            .disposed(by: disposeBag)
        
        self.postComment
            .withUnretained(self)
            .bind { vc, _ in
                vc.getReviewList(postId: vc.dailyPostId)
            }
            .disposed(by: disposeBag)
        
        return Output(commentList: self.commentList)
    }
}

extension CommentSheetPresentationViewModel {
    private func getReviewList(postId: Int) {
        Task {
            let comment = try await communityUseCase.getComment(query: CommentGetQuery(dailyPostId: postId))
            print(comment, "댓글 조회")
            self.commentList.accept(comment)
        }
    }
}

extension CommentSheetPresentationViewModel {
    private func postReview(postId: Int, content: String) {
        Task {
            let comment = try await communityUseCase.postComment(query: CommentPostQuery(dailyPostId: postId, content: content))
            print("댓글 작성 완료")
            self.postComment.accept(comment)
            self.postCommentDelegate?.sendPostComment(postId: comment.dailyPostId ?? 0)
        }
    }
}
