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
        let viewModel = LoginViewModel(coordinator: self, certificationUseCase: CertificationUseCase(userRepository: UserRepository(), petCommandoRepository: PetsCommandoRepository()))
        let vc = LoginViewController(viewModel: viewModel)
        changeAnimation()
        navigationController.viewControllers = [vc]
    }
    
    func showEmailViewController() {
        let viewModel = EmailViewModel(coordinator: self,
                                       certificationUseCase: CertificationUseCase(
                                        userRepository: UserRepository(),
                                        petCommandoRepository: PetsCommandoRepository()
                                       ))
        let vc = EmailViewController(viewModel: viewModel)
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showNicknameViewController() {
        let viewModel = NicknameViewModel(coordinator: self, certificationUseCase: CertificationUseCase(userRepository: UserRepository(), petCommandoRepository: PetsCommandoRepository()))
        let vc = NicknameViewController(viewModel: viewModel)
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPasswordViewController() {
        let viewModel = PasswordViewModel(coordinator: self, certificationUseCase: CertificationUseCase(userRepository: UserRepository(), petCommandoRepository: PetsCommandoRepository()))
        let vc = PasswordViewController(viewModel: viewModel)
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func connectTabBarCoordinator() {
        let tabBarCoordinator = TabBarCoordinator(self.navigationController)
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}

