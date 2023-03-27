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
//        let certificaionButtonTap: Signal<Void>
//        let nextButtonTap: Signal<Void>
    }

    struct Output {
        let emailValidation: Observable<Bool>
        let emailduplicationValidation: Observable<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let emailValid = input.emailText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
        let emailduplicationValid = input.emailText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()
        
//        let emailduplicationValid = input.certificaionButtonTap
//            .emit { [weak self] certificationEmail in
//                guard let self = self else { return }
//                self.certificationUserCase.excuteEmail(email: self.userDefaults.string(forKey: UserDefaultKeyCase.email) ?? "")
//            }.disposed(by: disposeBag)
                
        return Output(emailValidation: emailValid, emailduplicationValidation: emailduplicationValid)
    }
}
