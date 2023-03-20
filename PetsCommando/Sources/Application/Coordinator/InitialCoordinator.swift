//
//  AppCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

final class InitialCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(window: UIWindow) {
        self.childCoordinators = []
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let child = OnBoardingCoordinator(window: window)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
        window.rootViewController = child.navigationController
        window.makeKeyAndVisible()
    }
}
/*
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
        userDefaults.set(false, forKey: UserDefaultKeyCase.isNotFirstUser)
        userDefaults.set(false, forKey: UserDefaultKeyCase.isLoggedIn)
    }

    func start() {
//        if userDefaults.bool(forKey: UserDefaultKeyCase.isLoggedIn) {
//            connectTabBarCoordinator()
//        } else {
//            connectAuthCoordinator()
//        }
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
*/
