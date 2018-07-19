//
//  MineHeaderTableViewCell.swift
//  swiftTest
//
//  Created by Color on 2018/7/19.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit

class MineHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var iconBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var clickIconBtn: UIButton!
    
    
}
