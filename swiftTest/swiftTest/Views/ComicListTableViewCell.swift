//
//  ComicListTableViewCell.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit
import SwiftyJSON

class ComicListTableViewCell: UITableViewCell {
//let ComicListTableViewCellID = "ComicListTableViewCell"
    
    @IBOutlet weak var verticalImg: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var userNameLab: UILabel!
    
    @IBOutlet weak var titleLabWidthConstant: NSLayoutConstraint!
    @IBOutlet weak var userNameWidthConstant: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.userNameLab.layer.cornerRadius = self.userNameLab.frame.size.height/2
        self.userNameLab.layer.masksToBounds = true
        self.titleLab.layer.cornerRadius = self.titleLab.frame.size.height/2
        self.titleLab.layer.masksToBounds = true
    }
    
    
    public func cellWithModel(param : JSON) -> Void {
        
        let imgUrl = param["cover_image_url"].stringValue
        
        self.verticalImg.sd_setImage(with: URL.init(string: imgUrl), completed: nil)
//        self.verticalImg.sd_setImage(with: URL.init(string: imgUrl))
        self.userNameLab.text = param["user","nickname"].stringValue
        self.titleLab.text = param["title"].stringValue
        
        let titleWidth:CGFloat = CaculateTool.caculateTextWidth(caculateStr: param["title"].stringValue, fontSize: 14.0) + 5.0
        let userLabWidth:CGFloat = CaculateTool.caculateTextWidth(caculateStr: param["user","nickname"].stringValue, fontSize: 14.0) + 5.0
        
        self.titleLabWidthConstant.constant = titleWidth
        self.userNameWidthConstant.constant = userLabWidth
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
