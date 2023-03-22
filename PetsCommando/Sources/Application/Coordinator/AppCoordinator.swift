//
//  AppCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

final class AppCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .app

    private let userDefaults = UserDefaults.standard

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
//        userDefaults.set(false, forKey: UserDefaultKeyCase.isNotFirstUser)
//        userDefaults.set(false, forKey: UserDefaultKeyCase.isLoggedIn)
    }

    func start() {
        connectAuthFlow()
    }

    private func connectAuthFlow() {
        let authCoordinator = AuthCoordinator(self.navigationController)
        authCoordinator.delegate = self
        authCoordinator.start()
        childCoordinators.append(authCoordinator)
    }

    private func connectTabBarFlow() {
        let tabBarCoordinator = TabBarCoordinator(self.navigationController)
        tabBarCoordinator.delegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}

extension AppCoordinator: CoordinatorDelegate {

    func didFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter({ $0.type != childCoordinator.type })

        //self.navigationController.view.backgroundColor = .systemBackground
        self.navigationController.viewControllers.removeAll()

        switch childCoordinator.type {
        case .auth:
            self.connectTabBarFlow()
        case .tab:
            self.connectAuthFlow()
        default:
            break
        }
    }
}
