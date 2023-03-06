//
//  AppCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

/*
import UIKit

final class AppCoordinator: Coordinator {
    
    enum InitalViewType {
        case certification
    }
    
    var delegate: CoordinatorDidFinishDelegate?
    
    var presenter: UINavigationController
    
    private var window: UIWindow
        
    var childCoordinators: [Coordinator]
    
    init(window: UIWindow) {
        self.window = window
        self.childCoordinators = []
        self.presenter = UINavigationController()
    }
    
    func start(animated: Bool = true) {
        showInitialView(with: .certification)
    }
    
    func showInitialView(with type: InitalViewType) {
        presenter = UINavigationController()
        
        switch type {
        case .certification:
            showCertification(window: window)
        }
        
        self.window.makeKeyAndVisible()

        UIView.transition(with: self.window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppCoordinator: OnBoardingCoordinator { }
*/
