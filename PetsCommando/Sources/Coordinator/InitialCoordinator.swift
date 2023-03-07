//
//  InitialCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import UIKit

final class InitialCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = InitialViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        
        selectedController()
    }
    
    func selectedController() {
        let child = OnBoardingCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
}
