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
        let checkpwText: ControlProperty<String?>
    }

    struct Output {
        let idValidation: Observable<Bool>
        let pwValidation: Observable<Bool>
        let signUpValidation: Observable<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let idValid = input.idText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 12 }
            .share()
        
        let pwValid = Observable.combineLatest(input.pwText.orEmpty, input.checkpwText.orEmpty).map { $0 == $1 && $0.count >= 8 && $0.count <= 12 }
    
        let signUpValid = Observable.combineLatest(idValid, pwValid)
            .map { $0 && $1 }
        
        return Output(idValidation: idValid, pwValidation: pwValid, signUpValidation: signUpValid)
    }
}

