//
//  LoginCoordinatorContext.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

protocol LoginCoordinatorContext: BaseCoordinatorContext {
    func showLogin(window: UIWindow)
    func showSignUp(window: UIWindow)
}

extension LoginCoordinatorContext {
    func showLogin(window: UIWindow) {
        let coordinator = LoginCoordinator(window: window)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func showSignUp(window: UIWindow) {
        let coordinator = LoginCoordinator(window: window)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
