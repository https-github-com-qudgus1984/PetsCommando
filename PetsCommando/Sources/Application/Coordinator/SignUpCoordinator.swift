//
//  SignupCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import UIKit

class SignUpCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignUpViewController()
        navigationController.pushViewController(vc, animated: true)
        print(childCoordinators)
    }
    
    func startSignUp() {
        let vc = SignUpViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
