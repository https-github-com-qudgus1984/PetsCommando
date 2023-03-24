//
//  SignUpViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import Foundation
import RxSwift
import RxCocoa

final class SignUpViewModel: ViewModelType {
    
    private weak var coordinator: AuthCoordinator?

    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }
    
    struct Input {
        let idText: ControlProperty<String?>
        let pwText: ControlProperty<String?>
        let nicknameText: ControlProperty<String?>
        let checkpwText: ControlProperty<String?>
    }

    struct Output {
        let idValidation: Observable<Bool>
        let pwValidation: Observable<Bool>
        let nicknameValidation: Observable<Bool>
        let signUpValidation: Observable<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let idValid = input.idText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 20 && $0.range(of: "@") != nil && $0.range(of: ".") != nil }
            .share()

        let pwValid = Observable.combineLatest(input.pwText.orEmpty, input.checkpwText.orEmpty).map { $0 == $1 && $0.count >= 8 && $0.count <= 12 }
        
        let nicknameValid = input.nicknameText
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 12 }
            .share()
    
        let signUpValid = Observable.combineLatest(idValid, pwValid)
            .map { $0 && $1 }
        
        return Output(idValidation: idValid, pwValidation: pwValid, nicknameValidation: nicknameValid, signUpValidation: signUpValid)
    }
}

