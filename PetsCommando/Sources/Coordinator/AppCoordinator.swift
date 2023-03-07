//
//  AppCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(window: UIWindow) {
        self.childCoordinators = []
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let InitialCoordinator = InitialCoordinator(navigationController: navigationController)
        InitialCoordinator.start()
        window.rootViewController = InitialCoordinator.navigationController
        childCoordinators.append(InitialCoordinator)
        window.makeKeyAndVisible()
    }
}
