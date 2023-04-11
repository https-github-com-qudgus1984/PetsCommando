//
//  EmailViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/25.
//

import Foundation
import RxSwift
import RxCocoa

final class EmailViewModel: ViewModelType {
    
    private weak var coordinator: AuthCoordinator?
    private var certificationUserCase: CertificationUseCase

    init(coordinator: AuthCoordinator?, certificationUseCase: CertificationUseCase) {
        self.coordinator = coordinator
        self.certificationUserCase = certificationUseCase
    }
    
    struct Input {
        let emailText: ControlProperty<String?>
        let certificaionButtonTap: Signal<Void>
        let didNextButtonTap: Signal<String>
    }

    struct Output {
        let emailValidation: Observable<Bool>
        let emailduplicationValidation: Observable<Bool>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let emailValid = input.emailText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
        let emailduplicationValid = input.emailText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
        input.certificaionButtonTap
            .emit { [weak self] certificationEmail in
                guard let self = self else { return }
                print("이메일 중복확인 인증했다?")
                self.certificationUserCase.excuteEmail(email: "qudgus1984@naver.com")
            }.disposed(by: disposeBag)
                
        input.didNextButtonTap
            .emit { [weak self] text in
                guard let self = self else { return }
                self.saveEmailInfo(email: text)
                self.coordinator?.showNicknameViewController()
            }
            .disposed(by: disposeBag)
                
        return Output(emailValidation: emailValid, emailduplicationValidation: emailduplicationValid)
    }
    
//    func startDuplicationEmail(email: DuplicationEmailQuery) {
//        certificationUserCase.excuteEmail(email: email)
//    }
}

extension EmailViewModel {

    private func saveEmailInfo(email: String) {
        UserDefaults.standard.set(email, forKey: UserDefaultKeyCase.email)
    }
}
