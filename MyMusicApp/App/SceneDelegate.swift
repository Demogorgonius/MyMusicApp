//
//  SceneDelegate.swift
//  MyMusicApp
//
//  Created by Edward on 17.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let rootVC = OnboardingViewController()
        let navigationController = NavBarController(rootViewController: rootVC)
        window?.rootViewController = navigationController
//        window?.rootViewController = SettingsViewController()

        window?.makeKeyAndVisible()
        
    }
}

