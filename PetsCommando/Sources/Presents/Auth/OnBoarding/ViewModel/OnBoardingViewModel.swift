//
//  OnBoardingViewModel.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/21.
//

import Foundation

final class OnBoardingViewModel {
    
    private weak var coordinator: AuthCoordinator?

    init(coordinator: AuthCoordinator?) {
        self.coordinator = coordinator
    }

    func showLoginController() {
        coordinator?.showLoginViewController()
    }
    
}
