//
//  SceneDelegate.swift
//  MyMusicApp
//
//  Created by Edward on 12.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let rootVC = SignInViewController()
        let navigationController = NavBarController(rootViewController: rootVC)
        window?.rootViewController = navigationController
        window?.rootViewController = OnboardingViewController()

        window?.makeKeyAndVisible()
        
    }
}
