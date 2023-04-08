//
//  CommunityAndPetsListViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/07.
//

import UIKit
import Tabman
import Pageboy

final class CommunityAndPetsLostViewController: TabmanViewController {
    private var vcs: Array<BaseViewController> = [CommunityViewController(), PetsLostViewController()]
    private var vc1 = CommunityViewController()
    private var vc2 = PetsLostViewController()
    
    private let viewModel: CommunityAndPetsLostViewModel
    
    init(viewModel: CommunityAndPetsLostViewModel) {
        self.viewModel = viewModel
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
        
        navigationUI()
    }
    
    private func navigationUI() {
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: nil, action: #selector(tappedMyPage))
        self.navigationController?.navigationBar.backgroundColor = Color.BaseColor.white
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc
    func tappedMyPage() {
        print("mypageButtonClicked")
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
