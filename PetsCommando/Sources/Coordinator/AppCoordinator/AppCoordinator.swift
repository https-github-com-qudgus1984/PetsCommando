//
//  AppCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/04.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    enum InitalViewType {
        case login
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
        showInitialView(with: .login)
    }
    
    func showInitialView(with type: InitalViewType) {
        presenter = UINavigationController()
        
        switch type {
        case .login:
            showLogin(window: window)
        }
        
        self.window.makeKeyAndVisible()

        UIView.transition(with: self.window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppCoordinator: LoginCoordinatorContext { }
