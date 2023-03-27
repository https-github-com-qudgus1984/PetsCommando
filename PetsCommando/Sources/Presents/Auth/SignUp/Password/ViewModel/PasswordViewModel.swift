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
        let nicknameText: ControlProperty<String?>
    }

    struct Output {
        let nicknameValidation: Observable<Bool>
        let nicknameduplicationValidation: Observable<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        let nicknameValid = input.nicknameText
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10 }
            .share()
        
        let nicknameduplicationValid = input.nicknameText
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10 }
            .share()
        
        return Output(nicknameValidation: nicknameValid, nicknameduplicationValidation: nicknameduplicationValid)
    }
}
