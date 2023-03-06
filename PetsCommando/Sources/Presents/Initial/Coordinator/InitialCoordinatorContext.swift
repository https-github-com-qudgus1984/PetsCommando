//
//  InitialCoordinatorContext.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//
import UIKit

protocol InitialCoordinatorContext: BaseCoordinatorContext {
    func showInitialView(window: UIWindow)
}

extension InitialCoordinatorContext {
    func showInitialView(window: UIWindow) {
        let coordinator = InitialCoordinator(window: window)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

}
