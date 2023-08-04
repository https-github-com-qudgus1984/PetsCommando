//
//  TabmanCoordinator.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/19.
//

import UIKit
import RxCocoa

final class TabmanCoordinator: Coordinator {
    
    weak var delegate: CoordinatorDelegate?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var type: CoordinatorStyleCase = .tabman
    
    let postCommentEvent = PublishRelay<Int>()
    let finishDailyPost = PublishRelay<DailyPost>()
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabmanViewModel = CommunityAndPetsLostViewModel(coordinator: self)
        let tabmanviewController = CommunityAndPetsLostViewController(viewModel: tabmanViewModel, postCommentEvent: self.postCommentEvent, finishDailyPost: self.finishDailyPost)
        navigationController.pushViewController(tabmanviewController, animated: true)
    }
    
    func showCommunityDetailViewController(postId: Int) {
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let communityRepositoryImpl = CommunityRepositoryImpl(dataTransferService: dataTransferService)
        let communityUseCase = CommunityUseCaseImpl(communityRepository: communityRepositoryImpl)
        let viewModel = CommunityDetailViewModel(coordinator: self, communityUseCase: communityUseCase, dailyPostId: postId, postCommentEvent: self.postCommentEvent)
        let vc = CommunityDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPetsLostDetailViewController(organicAnimal: List) {
        let viewModel = PetsLostDetailViewModel(coordinator: self, organicAnimal: organicAnimal)
        let vc = PetsLostDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func deleteTabmanCoordinator() {
        self.delegate?.didFinish(childCoordinator: self)
    }
    
    func showCreateCommunityViewController() {
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let communityRepositoryImpl = CommunityRepositoryImpl(dataTransferService: dataTransferService)
        let communityUseCase = CommunityUseCaseImpl(communityRepository: communityRepositoryImpl)
        let viewModel = CreateCommunityViewModel(coordinator: self, communityUseCase: communityUseCase)
        viewModel.finishDailyPostDelegate = self
        let vc = CreateCommunityViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showCommentSheetPresentationViewController(postId: Int) {
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let communityRepositoryImpl = CommunityRepositoryImpl(dataTransferService: dataTransferService)
        let communityUseCase = CommunityUseCaseImpl(communityRepository: communityRepositoryImpl)
        let viewModel = CommentSheetPresentationViewModel(coordinator: self, communityUseCase: communityUseCase, dailyPostId: postId)
        viewModel.postCommentDelegate = self
        let vc = CommentSheetPresentationViewController(viewModel: viewModel)
        navigationController.present(vc, animated: true)
    }
}

extension TabmanCoordinator: postCommentDelegate {
    func sendPostComment(postId: Int) {
        self.postCommentEvent.accept(postId)

    }
}

extension TabmanCoordinator: finishDailyPostDelegate {
    func sendFinishPost(dailyPost: DailyPost) {
        self.finishDailyPost.accept(dailyPost)
    }
}
