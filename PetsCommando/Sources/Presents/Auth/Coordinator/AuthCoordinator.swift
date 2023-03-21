//
//  AuthCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/21.
//

import UIKit

final class AuthCoordinator: Coordinator {
    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .auth
    
    private let userDefaults = UserDefaults.standard

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showOnboardingViewController()
    }
    
    func showOnboardingViewController() {
        let viewModel = OnBoardingViewModel(coordinator: self)
        let vc = OnBoardingViewController(viewModel: viewModel)
        navigationController.viewControllers = [vc]
    }
    
    func showLoginViewController() {
        let viewModel = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: viewModel)
        navigationController.viewControllers = [vc]
    }
    
    func showSignUpViewController() {
        let viewModel = SignUpViewModel(coordinator: self)
        let vc = SignUpViewController(viewModel: viewModel)
        navigationController.viewControllers = [vc]
    }
    
    func connectTabBarCoordinator() {
        let tabBarCoordinator = TabBarCoordinator(self.navigationController)
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}

