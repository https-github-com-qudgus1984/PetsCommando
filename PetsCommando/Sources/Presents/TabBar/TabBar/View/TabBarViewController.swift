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
    private let test3VC = Test3ViewController()

    
    weak var coordinator: TabBarCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarUI()
        setTabBarNavigation()
    }
    
    
    private func tabBarUI() {

        homeVC.tabBarItem.image = UIImage(systemName: "house")
        testVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        test2VC.tabBarItem.image = UIImage(systemName: "character.book.closed")
        test3VC.tabBarItem.image = UIImage(systemName: "square.and.pencil")

    }
    
    private func setTabBarNavigation() {
        let homeNaviVC = UINavigationController(rootViewController: homeVC)
        let testNaviVC = UINavigationController(rootViewController: testVC)
        let test2NaviVC = UINavigationController(rootViewController: test2VC)
        let test3NaviVC = UINavigationController(rootViewController: test3VC)
        
        tabBar.tintColor = Color.BaseColor.hunt1
        
        setViewControllers([homeNaviVC, testNaviVC, test2NaviVC, test3NaviVC], animated: false)
    }
}
