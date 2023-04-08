//
//  CommunityAndPetsLostCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit

final class CommunityAndPetsLostCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .home

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(false, animated: false)
    }

    func start() {
        let vc = CommunityAndPetsLostViewController(
            viewModel: CommunityAndPetsLostViewModel(coordinator: self)
        )
        navigationController.pushViewController(vc, animated: true)
    }

    func changeTabToMyPageViewController(message: String) {
        navigationController.tabBarController?.selectedIndex = 3
        //        navigationController.tabBarController?.view.makeToast(message, position: .top)
        //    }
        
        func popToRootViewController(message: String? = nil) {
            navigationController.popToRootViewController(animated: true)
            //        if let message = message {
            //            navigationController.view.makeToast(message, position: .top)
            //        }
            
        }
    }
}
