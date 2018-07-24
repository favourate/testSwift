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

        //设置导航栏为半透明
        self.navigationBar.isTranslucent = true
        //设置导航栏字体属性
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16),
                                                  NSAttributedStringKey.foregroundColor:UIColor.red]

        //设置导航栏背景为空
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        
        //设置导航栏背景图
        let transparentView:UIImageView = UIImageView.init(image: UIImage.init(named: "nav_bar"))
        transparentView.frame = CGRect.init(x: 0, y: -UIApplication.shared.statusBarFrame.height, width: KScreenW, height: self.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height)
        self.navigationController?.transparentView = transparentView
        self.navigationBar.insertSubview(transparentView, at: 0);

    }

    //重写push方法 隐藏底部栏
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
             viewController.hidesBottomBarWhenPushed = true
        }
       
        super.pushViewController(viewController, animated: true)
    }

}

//运行时添加图片
extension UINavigationController {
    
    private struct AssociatedKeys{
        static var imgV:UIImageView?
    }
    
    var  transparentView : UIImageView? {
        
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.imgV) as? UIImageView
        }
        set{
            return objc_setAssociatedObject(self, &AssociatedKeys.imgV, 0, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
        
    }
    
    
}

