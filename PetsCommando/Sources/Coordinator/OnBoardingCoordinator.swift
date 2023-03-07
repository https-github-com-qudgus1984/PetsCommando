//
//  OnBoardingCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import UIKit

final class OnBoardingCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let vc = OnBoardingViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func rootViewControllerChangedLoginViewController() {
        let LoginCoordinator = LoginCoordinator(window: window)
        LoginCoordinator.start()
        window.rootViewController = LoginCoordinator.navigationController
        childCoordinators.append(LoginCoordinator)
        window.makeKeyAndVisible()
        UIView.transition(with: self.window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)

    }
}

