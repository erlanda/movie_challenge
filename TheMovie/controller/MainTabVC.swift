//
//  ViewController.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 10.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit

class MainTabVC: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorDesign.darkGrayColor
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let layout = UICollectionViewFlowLayout()
        let tabOne = UINavigationController(rootViewController: MovieListController(collectionViewLayout: layout))
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        tabOne.tabBarItem = tabOneBarItem
        tabOneBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
    
        
        // Create Tab two
        let tabTwo = UINavigationController(rootViewController: SearchMovieController()) 
        let tabTwoBarItem2 = UITabBarItem(title: "", image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
        tabTwoBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0);
        tabTwo.tabBarItem = tabTwoBarItem2
        self.viewControllers = [tabOne, tabTwo]

        //Change bg color
        UITabBar.appearance().backgroundColor = ColorDesign.blackColor
        self.tabBar.backgroundImage = UIImage()
        UITabBar.appearance().tintColor = ColorDesign.orangeColor

        

    }
 

}

