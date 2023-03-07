//
//  OnBoardingCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/07.
//

import UIKit

final class OnBoardingCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = OnBoardingViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
