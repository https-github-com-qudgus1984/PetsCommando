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
