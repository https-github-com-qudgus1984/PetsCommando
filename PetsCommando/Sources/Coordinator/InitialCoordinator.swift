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
        let onBoardingCoordinator = OnBoardingCoordinator(window: window)
        onBoardingCoordinator.start()
        window.rootViewController = onBoardingCoordinator.navigationController
        childCoordinators.append(onBoardingCoordinator)
        window.makeKeyAndVisible()
        print(childCoordinators)

    }
}
