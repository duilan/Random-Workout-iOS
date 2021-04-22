//
//  SceneDelegate.swift
//  RandomWorkout-iOS
//
//  Created by Adrian Cortes on 14/01/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func createTabBarController() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemBlue
        tabbar.viewControllers = [createHomeNC(), createHistoryNC()]
        return tabbar
    }
    
    func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Exercises"
        homeVC.tabBarItem = UITabBarItem(title: "Exercises", image: UIImage(systemName: "flame.fill"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createHistoryNC() -> UINavigationController {
        let historyVC = HistoryVC()
        historyVC.title = "History"
        historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "text.badge.checkmark"), tag: 1)
        return UINavigationController(rootViewController: historyVC)
    }

}

