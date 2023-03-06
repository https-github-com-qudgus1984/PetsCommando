//
//  CertificationContext.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit


protocol OnBoardingCoordinatorContext: BaseCoordinatorContext {
    func showOnBoarding(present: UINavigationController)
}


extension OnBoardingCoordinatorContext {
    func showOnBoarding(present: UINavigationController) {
        let coordinator = OnBoardingCoordinator(present: present)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

