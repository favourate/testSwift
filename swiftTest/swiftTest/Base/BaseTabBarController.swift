//
//  BaseTabBarController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        let mineVC = MineViewController.init(nibName: nil, bundle: nil)
        let mainVC = MainViewController.init(nibName: nil, bundle: nil)
        let comicListVC = ComicListViewController.init(nibName: nil, bundle: nil)
        
        let mineNav = BaseNavController.init(rootViewController: mineVC)
        let mainNav = BaseNavController.init(rootViewController: mainVC)
        let comicNav = BaseNavController.init(rootViewController: comicListVC)
        
        
        mineVC.tabBarItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "tab_recent_nor"), selectedImage: UIImage.init(named: "tab_recent_press"))
        mainVC.tabBarItem = UITabBarItem.init(title: "主页", image: UIImage.init(named: "tab_qworld_nor"), selectedImage: UIImage.init(named: "tab_qworld_press"))
        comicListVC.tabBarItem = UITabBarItem.init(title: "列表页", image: UIImage.init(named: "tab_buddy_nor"), selectedImage: UIImage.init(named: "tab_buddy_press"))
        
        self.viewControllers = [comicNav,mainNav,mineNav]
        
        self.tabBar.tintColor = UIColor.blue
        self.tabBar.isTranslucent  = true
        
        
    }

    
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
