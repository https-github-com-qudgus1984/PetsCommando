//
//  LoginCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow

    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushSignUpViewController() {
        let child = SignUpCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
