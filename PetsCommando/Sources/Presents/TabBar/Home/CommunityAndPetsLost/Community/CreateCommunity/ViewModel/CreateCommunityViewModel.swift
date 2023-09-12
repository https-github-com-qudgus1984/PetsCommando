//
//  CreateCommunityViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import UIKit

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
        let requestTextMessage: Signal<String>
    }
    
    var requestText = PublishRelay<String>()
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
                vc.uploadPost(with: query) { bool in
                    switch bool {
                        
                    case true:
                        NotificationCenter.default.post(name: NSNotification.Name("postCreate"), object: ())

                        vc.requestText.accept("글을 작성하였습니다.")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            vc.coordinator?.pop()
                        }
                    case false:
                        vc.requestText.accept("글 작성에 실패하셨습니다.")

                    }
                }
            }
            .disposed(by: disposeBag)
        
        return Output(postValid: postValid, dailyPostModel: self.dailyPostModel, requestTextMessage: requestText.asSignal())
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

extension CreateCommunityViewModel {
    func uploadPost(with model: DailyPostQuery, completion: @escaping ((Bool) -> Void)) {
        let url = URL(string: "http://3.36.125.115:9090/api/dailyPost")!
        let token = UserDefaults.standard.string(forKey: UserDefaultKeyCase.accessToken) ?? ""
        
        AF.upload(multipartFormData: { (multipartFormData) in
            // Add text data
            multipartFormData.append(model.title.data(using: .utf8)!, withName: "title")
            multipartFormData.append(model.content.data(using: .utf8)!, withName: "content")
            
                // Add image data if available
            multipartFormData.append(model.photo, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
            
        }, to: url,
           headers: ["Authorization": "Bearer \(token)"])
        .response { response in
            print(response.response?.statusCode)
            print(response.description)
            print(response.error)
            
            guard let statusCode = response.response?.statusCode else { return }
            switch statusCode {
            case 200:
                print("통신 성공")
                completion(true)
            default:
                print(statusCode, "통신 실패")
                debugPrint(response)
                completion(false)
            }
        }
    }
}

