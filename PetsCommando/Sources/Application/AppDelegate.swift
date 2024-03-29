//
//  AppDelegate.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/02/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //MARK: TabBar AppDelegate Setting
        let appearance = UITabBarAppearance()
        let tabBar = UITabBar()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Color.BaseColor.hunt4
        tabBar.standardAppearance = appearance;
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        //MARK: NetworkMonitoring
        NetworkMonitor.shared.startMonitoring()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

