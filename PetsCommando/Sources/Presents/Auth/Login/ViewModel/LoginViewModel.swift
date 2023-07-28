//
//  LoginViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel: ViewModelType {
    
    private weak var coordinator: AuthCoordinator?
    private var certificationUseCase: CertificationUseCase

    init(coordinator: AuthCoordinator?, certificationUseCase: CertificationUseCase) {
        self.coordinator = coordinator
        self.certificationUseCase = certificationUseCase
    }

    struct Input {
        let idText: ControlProperty<String?>
        let pwText: ControlProperty<String?>
        let loginButtonTap: Observable<LoginQuery>
    }

    struct Output {
        let idValidation: Observable<Bool>
        let pwValidation: Observable<Bool>
        let loginValidation: Observable<Bool>
        let requestTextMessage: Signal<String>
    }
    
    var disposeBag = DisposeBag()
    var isDuplicationLogin = BehaviorRelay<Bool>(value: false)
    var requestText = PublishRelay<String>()
    
    func transform(_ input: Input) -> Output {
        let idValid = input.idText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
        let pwValid = input.pwText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 12 }
            .share()
        
        input.loginButtonTap.subscribe { [weak self] loginQuery in
            guard let self = self else { return }
            self.certificationUseCase.excuteLogin(email: loginQuery.email, password: loginQuery.password)
        }
        .disposed(by: disposeBag)
    
        let loginValid = Observable.combineLatest(idValid, pwValid)
            .map { $0 && $1 }
        
        self.certificationUseCase.successLogin
            .subscribe { event in
                switch event {
                case .next(let statusCode):
                    switch statusCode {
                    case 200:
                        self.isDuplicationLogin.accept(true)
                        self.requestText.accept("로그인 되었습니다.")
                        self.coordinator?.connectTabBarCoordinator()
                    case 401:
                        self.requestText.accept("아이디와 비밀번호를 다시 한번 체크해 주세요.")
                    default:
                        self.requestText.accept("정의되지 않은 오류입니다.\(statusCode)")
                    }
                case .error(let error):
                    self.requestText.accept(error.localizedDescription)
                case .completed:
                    print("completed")
                }            }
            .disposed(by: disposeBag)
        
        
        return Output(idValidation: idValid, pwValidation: pwValid, loginValidation: loginValid, requestTextMessage: requestText.asSignal())
    }
    
    func showTabBarController() {
        coordinator?.connectTabBarCoordinator()
    }
    
    func showSignUpViewController() {
        coordinator?.showEmailViewController()
    }
    
    func showSidoViewController() {
        coordinator?.showSidoViewController()
    }
}


