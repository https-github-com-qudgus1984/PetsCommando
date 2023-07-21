//
//  SearchCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit

final class SearchCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .home

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(false, animated: false)
    }

    func start() {
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let hospitalRepositoryImpl = HospitalRepositoryImpl(dataTransferService: dataTransferService)
        let hospitalUseCaseImpl = HospitalUseCaseImpl(hospitalRepository: hospitalRepositoryImpl)
        let viewModel = SearchViewModel(coordinator: self, hospitalUseCase: hospitalUseCaseImpl)
        let vc = SearchViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

}
