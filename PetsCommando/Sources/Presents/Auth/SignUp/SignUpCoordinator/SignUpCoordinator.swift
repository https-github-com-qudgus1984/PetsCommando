//
//  SignUpCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit


class SignUpCoordinator: Coordinator {
    
    var delegate: CoordinatorDidFinishDelegate?
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    
    /// initialziation
    init(present: UINavigationController = UINavigationController()) {
        self.presenter = present
        self.childCoordinators = []
    }
    
    
    /// Custom Func
    func start(animated: Bool = true) {
        let viewcontroller = SignUpViewController()
        viewcontroller.coordinator = self
        viewcontroller.coordinatorDelegate = self
        presenter.pushViewController(viewcontroller, animated: animated)
    }
    
}



extension SignUpCoordinator: SignUpCoordinatorContext { }
