//
//  CommunityViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import Foundation
import RxSwift
import RxCocoa

final class CommunityViewModel: ViewModelType {
    
    weak var coordinator: TabmanCoordinator?
    private var communityUseCase: CommunityUseCase
    
    init(coordinator: TabmanCoordinator?, communityUseCase: CommunityUseCase) {
        self.coordinator = coordinator
        self.communityUseCase = communityUseCase
    }
    
    struct Input {
        let cellSelected: PublishSubject<IndexPath>
        let viewDidLoad: PublishRelay<Void>
        let createButtonTap: ControlEvent<Void>
        let choicePost: PublishRelay<ThumbnailDailyPost>
    }
    
    struct Output {
        let postList: PublishRelay<[ThumbnailDailyPost?]>
    }
    
    let postList = PublishRelay<[ThumbnailDailyPost?]>()

    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        input.cellSelected
            .bind { [weak self] _ in
                guard let self else { return }
//                showCommunityDetailViewController로 이동
            }
            .disposed(by: disposeBag)
        
        input.viewDidLoad
            .withUnretained(self)
            .bind { _ in
                self.getThumnailDailyPost()
            }
            .disposed(by: disposeBag)
        
        input.createButtonTap
            .withUnretained(self)
            .bind { vc, _ in
                self.coordinator?.showCreateCommunityViewController()
            }
            .disposed(by: disposeBag)
        
        input.choicePost
            .withUnretained(self)
            .bind { vc, data in
                guard let id = data.dailyPostId else { return }
                print("아이디 조회", id)
                vc.coordinator?.showCommunityDetailViewController(postId: id)
        }
            .disposed(by: disposeBag)
        
        return Output(postList: self.postList)
    }
}

extension CommunityViewModel {
    private func getThumnailDailyPost() {
        Task {
            let post = try await communityUseCase.getDailyPost()
            print(post, "커뮤니티글 조회")
            self.postList.accept(post)
        }
    }
}
