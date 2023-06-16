//
//  TabBarController.swift
//  MyMusicApp
//
//  Created by Иван Станкин on 15.06.2023.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        UITabBar.appearance().backgroundColor = UICatalog.Colors.brandBlack
        UITabBar.appearance().tintColor = UICatalog.Colors.brandLime
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
        let tabOne = TabOneTempController()
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "homeDefault"), selectedImage: UIImage(named: "homeActive"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = TabTwoTempController()
        let tabTwoBarItem = UITabBarItem(title: "", image: UIImage(named: "exploreDefault"), selectedImage: UIImage(named: "exploreActive"))
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = TabThreeTempController()
        let tabThreeBarItem = UITabBarItem(title: "", image: UIImage(named: "favoritesDefault"), selectedImage: UIImage(named: "favoritesActive"))
        
        tabThree.tabBarItem = tabThreeBarItem
        
        let tabFour = TabFourTempController()
        let tabFourBarItem = UITabBarItem(title: "", image: UIImage(named: "accountDefault"), selectedImage: UIImage(named: "accountActive"))
        
        tabFour.tabBarItem = tabFourBarItem
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
        
    }
}
