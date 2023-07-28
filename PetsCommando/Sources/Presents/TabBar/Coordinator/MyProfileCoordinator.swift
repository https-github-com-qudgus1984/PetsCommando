//
//  MyProfileCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit

final class MyProfileCoordinator: Coordinator {

    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .myProfile
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(false, animated: false)
    }

    func start() {
        let viewModel = MyProfileViewModel(coordinator: self)
        let vc = MyProfileViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

    func showLocationModifySidoViewController() {
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let regionRepositoryImpl = RegionRepositoryImpl(dataTransferService: dataTransferService)
        let regionUseCaseImpl = RegionUseCaseImpl(regionRepository: regionRepositoryImpl)
        let viewModel = LocationModifySidoViewModel(coordinator: self, regionUseCase: regionUseCaseImpl)
        let vc = LocationModifySidoViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showLocationModifySigunguViewController() {
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let regionRepositoryImpl = RegionRepositoryImpl(dataTransferService: dataTransferService)
        let regionUseCaseImpl = RegionUseCaseImpl(regionRepository: regionRepositoryImpl)
        let viewModel = LocationModifySigunguViewModel(coordinator: self, regionUseCase: regionUseCaseImpl)
        let vc = LocationModifySigunguViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func restart() {
        self.navigationController.popToRootViewController(animated: true)
//        let navi = UINavigationController()
//        let viewModel = OnBoardingViewModel(coordinator: AuthCoordinator(navi))
//        let loginViewController = OnBoardingViewController(viewModel: viewModel)
//        let navigationController = UINavigationController(rootViewController: loginViewController)
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//        guard let delegate = sceneDelegate else {
//            // 에러 알림
//            return
//        }
//        delegate.window?.rootViewController = navigationController
    }
}
