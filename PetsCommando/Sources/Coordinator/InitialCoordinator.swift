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
        let OnBoardingCoordinator = OnBoardingCoordinator(window: window)
        OnBoardingCoordinator.start()
        window.rootViewController = OnBoardingCoordinator.navigationController
        childCoordinators.append(OnBoardingCoordinator)
        window.makeKeyAndVisible()
    }
}
