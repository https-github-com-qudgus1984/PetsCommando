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
        navigationController.setNavigationBarHidden(true, animated: false)
//        UserDefaults.standard.set(MatchStatus.general.rawValue, forKey: UserDefaultKeyCase.matchStatus)
    }

    func start() {
        let vc = HomeViewController(
            viewModel: HomeViewModel(coordinator: self)
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
