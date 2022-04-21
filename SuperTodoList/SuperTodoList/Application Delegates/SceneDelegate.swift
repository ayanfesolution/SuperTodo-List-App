//
//  SceneDelegate.swift
//  SuperTodoList
//
//  Created by Decagon on 4/16/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        window = UIWindow(windowScene: windowScene)
        let rootViewController = OnboardingViewController()
        let main = UINavigationController(rootViewController: rootViewController)
        window?.rootViewController = main
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
         
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
     
    }


}
