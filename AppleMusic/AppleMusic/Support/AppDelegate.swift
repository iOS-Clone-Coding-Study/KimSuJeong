//
//  AppDelegate.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //MARK: NavigationBar Blur Effect
        //let appearance = UINavigationBarAppearance()
        //appearance.configureWithDefaultBackground()
        //appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        
        //let scrollingAppearance = UINavigationBarAppearance()
        //scrollingAppearance.configureWithDefaultBackground()
        //scrollingAppearance.backgroundColor = .white
       
        //UINavigationBar.appearance().standardAppearance = appearance
        //UINavigationBar.appearance().scrollEdgeAppearance = scrollingAppearance
        //UINavigationBar.appearance().compactAppearance = scrollingAppearance
        
        //MARK: TabBar Blur Effect
        //let tabappearance = UITabBarAppearance()
        //tabappearance.configureWithDefaultBackground()
        //tabappearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        
        //UITabBar.appearance().standardAppearance = tabappearance
        
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

