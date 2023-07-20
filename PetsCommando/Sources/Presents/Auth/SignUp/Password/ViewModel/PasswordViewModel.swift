//
//  PasswordViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import RxSwift
import RxCocoa

final class PasswordViewModel: ViewModelType {
    
    private weak var coordinator: AuthCoordinator?
    private var certificationUseCase: CertificationUseCase
    private let userDefaults = UserDefaults.standard

    init(coordinator: AuthCoordinator?, certificationUseCase: CertificationUseCase) {
        self.coordinator = coordinator
        self.certificationUseCase = certificationUseCase
    }
    
    struct Input {
        let passwordText: ControlProperty<String?>
        let checkpwText: ControlProperty<String?>
        let didNextButtonTap: Signal<String>
    }

    struct Output {
        let pwValidation: Observable<Bool>
        let signUpValidation: Observable<Bool>
        let requestTextMessage: Signal<String>
    }
    
    var disposeBag = DisposeBag()
    var isDuplicationSignupSuccess = BehaviorRelay<Bool>(value: false)
    var requestText = PublishRelay<String>()
    
    func transform(_ input: Input) -> Output {
        
        let regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[a-z])(?=.*[!@#$])[A-Za-z\\d!@#$]{8,16}$"

        let pwValid = input.passwordText
            .orEmpty
            .map {  NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: $0) }
            .share()

        
        input.didNextButtonTap
            .emit { [weak self] text in
                guard let self = self else { return }
                guard let email = self.userDefaults.string(forKey: UserDefaultKeyCase.email) else { return }
                guard let nickname = self.userDefaults.string(forKey: UserDefaultKeyCase.nickname) else { return }
                
                self.certificationUseCase.excuteRegister(email: email, nickname: nickname, password: text)
            }
            .disposed(by: disposeBag)
        
        self.certificationUseCase.successRegister
            .subscribe { event in
                switch event {
                case .next(let statusCode):
                    switch statusCode {
                    case 201:
                        self.isDuplicationSignupSuccess.accept(true)
                        self.requestText.accept("회원가입이 정상적으로 완료되었습니다.")
                        self.coordinator?.showSidoViewController()
                    case 400:
                        self.requestText.accept("비밀번호는 8자리 이상 16자리 이하, 영어 대소문자 각각 최소 한 개 이상, 숫자 최소 한 개 이상, 특수기호 중 !, @, #, $ 최소 한 개 이상을 포함해야 합니다.(나머지 특수문자, 공백, 한글 불가)")
                    default:
                        self.requestText.accept("정의되지 않은 오류입니다.\(statusCode)")
                    }
                case .error(let error):
                    self.requestText.accept(error.localizedDescription)
                case .completed:
                    print("completed")
                }
            }
            .disposed(by: disposeBag)
        
        let signUpValid = Observable.combineLatest(input.passwordText.orEmpty, input.checkpwText.orEmpty).map { $0 == $1 && $0.count >= 8 && $0.count <= 16 }
        
        return Output(pwValidation: pwValid, signUpValidation: signUpValid, requestTextMessage: requestText.asSignal())
    }
}

