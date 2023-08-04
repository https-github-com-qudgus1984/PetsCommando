//
//  CreateCommunityViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation
import RxSwift
import RxCocoa

protocol finishDailyPostDelegate {
    func sendFinishPost(dailyPost: DailyPost)
}

final class CreateCommunityViewModel: ViewModelType {
    
    weak var coordinator: TabmanCoordinator?
    private var communityUseCase: CommunityUseCase
    var finishDailyPostDelegate: finishDailyPostDelegate?
    
    init(coordinator: TabmanCoordinator?, communityUseCase: CommunityUseCase) {
        self.coordinator = coordinator
        self.communityUseCase = communityUseCase
    }
    
    struct Input {
        let titleText: ControlProperty<String?>
        let contentText: ControlProperty<String?>
        let registerButtonTap: Observable<DailyPostQuery>
    }
    
    struct Output {
        let postValid: Observable<Bool>
        let dailyPostModel: PublishRelay<DailyPost>
    }
        
    let dailyPostModel = PublishRelay<DailyPost>()
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        
        let titleValid = input.titleText
            .orEmpty
            .map { $0.count > 1 }
            .share()
        
        let contentValid = input.contentText
            .orEmpty
            .map { $0.count > 1 }
            .share()
        
        let postValid = Observable.combineLatest(titleValid, contentValid)
            .map{ $0 && $1 }
        
        postValid
            .withUnretained(self)
            .bind { vc, valid in
            print(valid, "글올릴수있니")
        }
            .disposed(by: disposeBag)
        
        input.registerButtonTap
            .withUnretained(self)
            .bind { vc, query in
                print(query, "딸깍딸깍")
                self.postCommunityPost(query: query)
            }
            .disposed(by: disposeBag)
        
        return Output(postValid: postValid, dailyPostModel: self.dailyPostModel)
    }
}

extension CreateCommunityViewModel {
    private func postCommunityPost(query: DailyPostQuery) {
        Task {
            let post = try await communityUseCase.postDailyPost(query: query)
            print(post, "커뮤니티 글 포스트 성공")
            self.dailyPostModel.accept(post)
            self.finishDailyPostDelegate?.sendFinishPost(dailyPost: post)
        }
    }
}
