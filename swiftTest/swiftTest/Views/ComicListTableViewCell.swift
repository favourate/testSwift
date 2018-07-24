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
        //设置图层
        self.userNameLab.layer.cornerRadius = self.userNameLab.frame.size.height/2
        self.userNameLab.layer.masksToBounds = true
        self.titleLab.layer.cornerRadius = self.titleLab.frame.size.height/2
        self.titleLab.layer.masksToBounds = true
    }
    
    
    public func cellWithModel(param : JSON) -> Void {
        
        let imgUrl = param["cover_image_url"].stringValue
        
        self.verticalImg.sd_setImage(with: URL.init(string: imgUrl), completed: nil)
        self.userNameLab.text = param["user","nickname"].stringValue
        self.titleLab.text = param["title"].stringValue
        
        ///这个地方计算会出现明显的卡顿

        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
