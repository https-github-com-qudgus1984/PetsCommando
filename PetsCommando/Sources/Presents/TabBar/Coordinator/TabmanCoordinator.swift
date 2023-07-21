//
//  TabmanCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit

final class TabmanCoordinator: Coordinator {
    
    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .tabman
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabmanViewModel = CommunityAndPetsLostViewModel(coordinator: self)
        let tabmanviewController = CommunityAndPetsLostViewController(viewModel: tabmanViewModel)
        navigationController.pushViewController(tabmanviewController, animated: true)
    }
    
//    func showCommunityDetailViewController() {
//        let viewModel = CommunityDetailViewModel(coordinator: self)
//        let vc = CommunityDetailViewController(viewModel: viewModel)
//        navigationController.pushViewController(vc, animated: true)
//    }
    
    func showPetsLostDetailViewController(organicAnimal: List) {
        let viewModel = PetsLostDetailViewModel(coordinator: self, organicAnimal: organicAnimal)
        let vc = PetsLostDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
