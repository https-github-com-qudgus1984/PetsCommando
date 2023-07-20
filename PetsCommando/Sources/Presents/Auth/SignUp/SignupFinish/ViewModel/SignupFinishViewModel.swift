//
//  SignupFinishViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/20.
//

import Foundation

final class SignupFinishViewModel {
    
    private weak var coordinator: AuthCoordinator?

    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }

    func showLoginController() {
        coordinator?.showLoginViewController()
    }
    
}
