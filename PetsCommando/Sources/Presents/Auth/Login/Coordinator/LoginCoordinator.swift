//
//  LoginCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

class LoginCoordinator: Coordinator {
    private var window: UIWindow

    var delegate: CoordinatorDidFinishDelegate?

    var presenter: UINavigationController

    var childCoordinators: [Coordinator] = []

    private var navigationController: UINavigationController!

    /// initialziation
    init(window: UIWindow) {
        self.window = window
        self.childCoordinators = []
        self.presenter = UINavigationController()
    }

    func start(animated: Bool = true) {
        let viewcontroller = LoginViewController()
        viewcontroller.coordinator = self
        viewcontroller.coordinatorDelegate = self
        window.rootViewController = viewcontroller
    }
}

// MARK: App
extension LoginCoordinator : AppCoordinatorContext { }

extension LoginCoordinator : SignUpCoordinatorContext { }
