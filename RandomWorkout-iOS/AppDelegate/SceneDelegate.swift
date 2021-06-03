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
        UITabBar.appearance().tintColor = .systemIndigo
        tabbar.viewControllers = [createHomeNC(), createHistoryNC(), createExercisesNC()]
        return tabbar
    }
    
    func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Workouts"        
        homeVC.tabBarItem = UITabBarItem(title: "Workouts", image: UIImage(systemName: "flame.fill"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createHistoryNC() -> UINavigationController {
        let historyVC = HistoryVC()
        historyVC.title = "History"
        historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), tag: 1)
        return UINavigationController(rootViewController: historyVC)
    }
    
    func createExercisesNC() -> UINavigationController {
        let exercisesVC = ExercisesVC()
        exercisesVC.title = "Exercises"
        exercisesVC.tabBarItem = UITabBarItem(title: "Exercises", image: UIImage(systemName: "rectangle.grid.2x2"), tag: 1)
        return UINavigationController(rootViewController: exercisesVC)
    }

}

