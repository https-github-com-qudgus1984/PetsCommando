//
//  TabBarCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/09.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow

    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let vc = TabBarViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

