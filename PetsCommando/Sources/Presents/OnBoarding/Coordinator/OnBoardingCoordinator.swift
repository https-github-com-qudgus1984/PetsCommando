//
//  CertificationCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit

class OnBoardingCoordinator: Coordinator {
    
    var delegate: CoordinatorDidFinishDelegate?
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    
    /// initialziation
    init(present: UINavigationController = UINavigationController()) {
        self.childCoordinators = []
        self.presenter = present
    }
    
    
    /// Custom Func
    func start(animated: Bool = true) {
        let viewcontroller = OnBoardingViewController()
        viewcontroller.coordinator = self
        viewcontroller.coordinatorDelegate = self
        presenter.pushViewController(viewcontroller, animated: animated)
    }
    
}


// MARK: - App
extension OnBoardingCoordinator : InitialCoordinatorContext { }
