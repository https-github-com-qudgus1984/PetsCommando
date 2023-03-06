//
//  SignUpCoordinatorContext.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import Foundation


protocol SignUpCoordinatorContext: BaseCoordinatorContext {
    func startSignUp()
}


extension SignUpCoordinatorContext {
    func startSignUp() {
        let coordinator = SignUpCoordinator(present: presenter)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
