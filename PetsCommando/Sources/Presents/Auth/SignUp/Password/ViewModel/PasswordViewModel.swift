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

    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let passwordText: ControlProperty<String?>
        let checkpwText: ControlProperty<String?>
        let didNextButtonTap: Signal<String>
    }

    struct Output {
        let pwValidation: Observable<Bool>
        let signUpValidation: Observable<Bool>
    }
    
    var disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        
        let regex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$])[A-Za-z\\d!@#$]{8,16}$"

        let pwValid = input.passwordText
            .orEmpty
            .map {  NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: $0) }
            .share()

        
        input.didNextButtonTap
            .emit { [weak self] text in
                guard let self = self else { return }
                print(text)
                self.coordinator?.showLoginViewController()
            }
            .disposed(by: disposeBag)
        
        let signUpValid = Observable.combineLatest(input.passwordText.orEmpty, input.checkpwText.orEmpty).map { $0 == $1 && $0.count >= 8 && $0.count <= 16 }
        
        return Output(pwValidation: pwValid, signUpValidation: signUpValid)
    }
}

