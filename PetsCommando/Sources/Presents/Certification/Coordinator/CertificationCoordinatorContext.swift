//
//  CertificationContext.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit

protocol CertificationCoordinatorContext: BaseCoordinatorContext {
    func showCertification(window: UIWindow)
}

extension CertificationCoordinatorContext {
    func showCertification(window: UIWindow) {
        let coordinator = CertificationCoordinator(window: window)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
