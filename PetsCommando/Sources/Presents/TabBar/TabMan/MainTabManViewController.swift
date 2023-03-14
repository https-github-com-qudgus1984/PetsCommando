//
//  TabManViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/14.
//

import UIKit
import Tabman
import Pageboy

final class MainTabManViewController: TabmanViewController {
    
    var viewControllers: [BaseViewController] = [
        HomeViewController(), HomeViewController()
    ]
    
    override func viewDidLoad() {
        tabmanSetting()
        naviSetting()
    }
    
    private func naviSetting() {
        guard let navigationController = navigationController else { return }
        navigationController.isNavigationBarHidden = false

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "house"), style: .plain, target: self, action: #selector(pushMyPageButtonClicked))
    }
    
    private func tabmanSetting() {
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        settingTabBar(ctBar: bar)
        addBar(bar, dataSource: self, at: .top)
    }
    
    func settingTabBar(ctBar: TMBar.ButtonBar) {

        ctBar.layout.transitionStyle = .snap
        // 왼쪽 여백주기
        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)

        // 간격
        ctBar.layout.interButtonSpacing = 20
        ctBar.backgroundView.style = .clear

        // 선택 & 선택X시 색 + 폰트사이즈
        ctBar.buttons.customize { (button) in
            button.tintColor = Color.BaseColor.gray6
            button.selectedTintColor = Color.BaseColor.hunt4
            button.font = Font.Body2_L16!
            button.selectedFont = Font.Body2_L16!

        }

        // 인디케이터
        ctBar.layout.contentMode = .fit
        ctBar.layout.alignment = .leading
        ctBar.indicator.weight = .light
        ctBar.indicator.tintColor = Color.BaseColor.hunt4
    }
}

extension MainTabManViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0:
            return TMBarItem(title: "커뮤니티")
        case 1:
            return TMBarItem(title: "유기동물 리스트")
        default:
            return TMBarItem(title: "Empty")
        }
    }
}

extension MainTabManViewController {
    @objc func pushMyPageButtonClicked() {
        
    }
}
