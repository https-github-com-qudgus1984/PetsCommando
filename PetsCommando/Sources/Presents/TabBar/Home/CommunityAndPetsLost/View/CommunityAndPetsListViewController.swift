//
//  CommunityAndPetsListViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import Tabman
import Pageboy
import RxCocoa

final class CommunityAndPetsLostViewController: TabmanViewController {
    
    private var vc1: CommunityViewController
    private var vc2: PetsLostViewController
    private var vcs: Array<BaseViewController>
    
    private let viewModel: CommunityAndPetsLostViewModel
    private var postCommentEvent: PublishRelay<Int>
    private var finishDailyPost: PublishRelay<DailyPost>
    
    init(viewModel: CommunityAndPetsLostViewModel, postCommentEvent: PublishRelay<Int>, finishDailyPost: PublishRelay<DailyPost>) {
        self.viewModel = viewModel
        self.postCommentEvent = postCommentEvent
        self.finishDailyPost = finishDailyPost
        let dataTransferService = DataTransferService(networkService: NetworkService())
        let organicAnimalRepositoryImpl = OrganicAnimalRepositoryImpl(dataTransferService: dataTransferService)
        let organicAnimalUseCaseImpl = OrganicAnimalUseCaseImpl(organicAnimalRepository: organicAnimalRepositoryImpl)
        let communityRepositoryImpl = CommunityRepositoryImpl(dataTransferService: dataTransferService)
        let communityUseCaseImpl = CommunityUseCaseImpl(communityRepository: communityRepositoryImpl)
        let communityViewModel = CommunityViewModel(coordinator: viewModel.coordinator, communityUseCase: communityUseCaseImpl, postCommentEvent: postCommentEvent, finishDailyPostEvent: finishDailyPost)

        let petsLoatViewModel = PetsLostViewModel(coordinator: viewModel.coordinator, organicAnimalUseCase: organicAnimalUseCaseImpl)
        vc1 = .init(viewModel: communityViewModel)
        vc2 = .init(viewModel: petsLoatViewModel)
        
        vcs = .init([vc1, vc2])
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("CommunityAndPetsLostViewController: fatal error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.buttons.customize { button in
            button.tintColor = Color.BaseColor.black
            button.selectedTintColor = Color.BaseColor.hunt2
        }
        
        bar.indicator.tintColor = Color.BaseColor.hunt2
        bar.indicator.weight = .light
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 35
        bar.layout.transitionStyle = .snap
        
        addBar(bar, dataSource: self, at: .top)
        
    }
}

extension CommunityAndPetsLostViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "커뮤니티")
        case 1:
            return TMBarItem(title: "유기 동물 리스트")
        default:
            let title = "Page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return vcs.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return vcs[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
