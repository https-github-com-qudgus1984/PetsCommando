//
//  CommunityDetailViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation
import RxSwift
import RxCocoa

final class CommunityDetailViewModel: ViewModelType {
    
    weak var coordinator: TabmanCoordinator?
    private var communityUseCase: CommunityUseCase
    private var dailyPostId: Int
    
    init(coordinator: TabmanCoordinator?, communityUseCase: CommunityUseCase, dailyPostId: Int) {
        self.coordinator = coordinator
        self.communityUseCase = communityUseCase
        self.dailyPostId = dailyPostId
    }
    
    var disposeBag = DisposeBag()
    
    let commentList = PublishRelay<[Comment?]>()
    let post = PublishRelay<DetailDailyPost>()

    struct Input {
        let viewDidLoad: PublishRelay<Void>
        let reviewButtonTap: ControlEvent<Void>
    }
    
    struct Output {
        let commentList: PublishRelay<[Comment?]>
        let post: PublishRelay<DetailDailyPost>
    }
    
    func transform(_ input: Input) -> Output {
        
        input.viewDidLoad
            .withUnretained(self)
            .bind { vc, _ in
                vc.getDetailPost(postId: vc.dailyPostId)
                vc.getReviewList(postId: vc.dailyPostId)
            }
            .disposed(by: disposeBag)
        
        input.reviewButtonTap
            .withUnretained(self)
            .bind { vc, _ in
                vc.coordinator?.showCommentSheetPresentationViewController(postId: vc.dailyPostId)
            }
            .disposed(by: disposeBag)
        
        return Output(commentList: self.commentList, post: self.post)
    }
}

extension CommunityDetailViewModel {
    private func getReviewList(postId: Int) {
        Task {
            let comment = try await communityUseCase.getComment(query: CommentGetQuery(dailyPostId: postId))
            print(comment, "댓글 조회")
            self.commentList.accept(comment)
        }
    }
}
extension CommunityDetailViewModel {
    private func getDetailPost(postId: Int) {
        Task {
            let post = try await communityUseCase.getDetailDailyPost(query: DetailDailyPostQuery(dailyPostId: postId))
            print(post, "디테일포스트 조회")
            self.post.accept(post)
        }
    }
}


