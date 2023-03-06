//
//  CertificationCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/06.
//

import UIKit

class CertificationCoordinator: Coordinator {
    private var window: UIWindow

    var delegate: CoordinatorDidFinishDelegate?

    var presenter: UINavigationController

    var childCoordinators: [Coordinator] = []

    private var navigationController: UINavigationController!

    /// initialziation
    init(window: UIWindow) {
        self.window = window
        self.childCoordinators = []
        self.presenter = UINavigationController()
    }

    func start(animated: Bool = true) {
        let viewcontroller = CertificationViewController()
        viewcontroller.coordinator = self
        viewcontroller.coordinatorDelegate = self
        window.rootViewController = viewcontroller
    }
}

// MARK: App
extension CertificationCoordinator : AppCoordinatorContext { }

extension CertificationCoordinator : CertificationCoordinatorContext { }
