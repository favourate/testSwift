//
//  BaseNavController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationBar.tintColor = UIColor.red
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.backgroundColor:UIColor.white,
                                                  NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16),
                                                  NSAttributedStringKey.foregroundColor:UIColor.blue]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
             viewController.hidesBottomBarWhenPushed = true
        }
       
        super.pushViewController(viewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
