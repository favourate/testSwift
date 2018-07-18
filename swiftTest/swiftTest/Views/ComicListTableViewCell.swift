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
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
    public func cellWithModel(param : JSON) -> Void {
        
        let imgUrl = param["cover_image_url"].stringValue
        
        self.verticalImg.sd_setImage(with: URL.init(string: imgUrl), completed: nil)
//        self.verticalImg.sd_setImage(with: URL.init(string: imgUrl))
        self.userNameLab.text = param["user","nickname"].stringValue
        self.titleLab.text = param["title"].stringValue
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
