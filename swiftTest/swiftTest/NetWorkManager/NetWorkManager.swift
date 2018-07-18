//
//  NetWorkManager.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class NetWorkManager: NSObject {

    class func getMethodNetWorkWith(URL url:String, Parameter para:[String:Any],success: @escaping(_ response:JSON) ->(),failure:@escaping (_ response:JSON)->()){
        
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForResource = 10
        let urlStr = "http://api.kuaikanmanhua.com/v1/" + url
        manager.request(urlStr, method: HTTPMethod.get, parameters: para, encoding:URLEncoding.default, headers:[:]).responseJSON { (respondeData) in
            
            if respondeData.result.isSuccess{
                
                success(JSON(respondeData.result.value ?? ["success":"000"]))
            }else{
                failure(JSON(respondeData.result.value ?? ["error":"error"]))
            }
            
        }
        
        
        
    }
    
}
