//
//  TabBarViewController.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/03/08.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let homeVC = HomeViewController()
    private let testVC = TestViewController()
    private let test2VC = Test2ViewController()
    
    weak var coordinator: TabBarCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarUI()
        setTabBarNavigation()
    }
    
    private func tabBarUI() {
        homeVC.title = "홈"
        testVC.title = "테스트"
        test2VC.title = "테스트2"

        homeVC.tabBarItem.image = UIImage(systemName: "house")
        testVC.tabBarItem.image = UIImage(systemName: "house")
        test2VC.tabBarItem.image = UIImage(systemName: "house")
    }
    
    private func setTabBarNavigation() {
        let homeNaviVC = UINavigationController(rootViewController: homeVC)
        let testNaviVC = UINavigationController(rootViewController: testVC)
        let test2NaviVC = UINavigationController(rootViewController: test2VC)

        setViewControllers([homeNaviVC, testNaviVC, test2NaviVC], animated: false)
    }
}
