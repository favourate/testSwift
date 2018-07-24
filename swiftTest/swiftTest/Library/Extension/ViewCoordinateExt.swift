//
//  ViewCoordinate.swift
//  swiftTest
//
//  Created by Color on 2018/7/20.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import Foundation

extension UIView{
    
    
    func getX() -> CGFloat {
        return self.frame.origin.x
    }
    
    func getY() -> CGFloat {
        return self.frame.origin.y
    }
    
    func getWidth() -> CGFloat {
        return self.bounds.size.width
    }
    
    func getHeight() -> CGFloat {
        return self.bounds.size.height
    }
    
    
    func getCenter() -> CGPoint {
        return self.center
    }
    
    func getCenterX() -> CGFloat {
        return self.center.x
    }
    
    func getCenterY() -> CGFloat {
        return self.center.y
    }
    
    func setX(x:CGFloat) -> Void {
        var rect = self.frame
        rect.origin.x = x
        self.frame = rect
    }
    
    func setY(y:CGFloat) -> Void {
        var rect = self.frame
        rect.origin.y = y
        self.frame = rect
    }
    
    func setWidth(width:CGFloat) -> Void {
        var rect = self.frame
        rect.size.width = width
        self.frame = rect
    }
    
    func setHeight(height:CGFloat) -> Void {
        var rect = self.frame
        rect.size.height = height
        self.frame = rect
    }
    
    
    func setCenter(center : CGPoint) -> Void {
        self.center = center
    }
    
    func setCenterX(centerX:CGFloat) -> Void {
        var center = self.center
        center.x = centerX
        self.center = center
    }
    
    func setCenterY(centerY : CGFloat) -> Void {
        var center = self.center
        center.y = centerY
        self.center = center
    }
    
    
    
}
