//
//  LoginCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    weak var parentCoordinator: OnBoardingCoordinator?
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
    
    func rootViewControllerChangedToTabBarController() {
        let child = TabBarCoordinator(window: window)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
        window.rootViewController = child.navigationController
        window.makeKeyAndVisible()
        UIView.transition(with: self.window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
