//
//  BaseViewController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit
import SwiftyJSON
typealias alertCallBack = (() -> Void)

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.7)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /** 弹出框显示 */
    public  func alertViewWithMessage(Message message:String! ,callBack:@escaping ()->Void) ->Void{
        
        let alertController = UIAlertController.init(title: "提示", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let ackAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default) { (success) in
            callBack()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(ackAction)
        alertController.show(self, sender: nil)
        self.navigationController?.present(alertController, animated: true, completion: nil)
        
    }



}
