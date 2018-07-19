//
//  CaculateTool.swift
//  swiftTest
//
//  Created by Color on 2018/7/19.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import Foundation
import UIKit
class CaculateTool: NSObject {
    
    class func caculateTextHeight(caculateString:String , fontSize: CGFloat ) ->CGFloat{
        
        let str:NSString = NSString.init(string: caculateString)
        let height:CGFloat = str.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: 0), options:.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize)], context: nil).size.height
        return height
    }
    
    
    class func caculateTextWidth(caculateStr:String , fontSize: CGFloat) ->CGFloat{
        let str:NSString = NSString(format: "%@",caculateStr)
        let width:CGFloat = str.boundingRect(with: CGSize.init(width:0, height: 20), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: fontSize)], context: nil).size.width
        return width
        
    }
    
    
}

extension String {
    
    func ga_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.width)
    }
    
    func ga_heightForComment(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.height)
    }
    
    func ga_heightForComment(fontSize: CGFloat, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.height)>maxHeight ? maxHeight : ceil(rect.height)
    }
    

    
}
