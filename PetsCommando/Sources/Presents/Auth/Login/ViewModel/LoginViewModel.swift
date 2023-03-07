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
    
    struct Input {
        let idText: ControlProperty<String?>
        let pwText: ControlProperty<String?>
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
        
        let pwValid = input.pwText
            .orEmpty
            .map { $0.count >= 8 && $0.count <= 12 }
            .share()
    
        let signUpValid = Observable.combineLatest(idValid, pwValid)
            .map { $0 && $1 }
        
        return Output(idValidation: idValid, pwValidation: pwValid, signUpValidation: signUpValid)
    }
}
