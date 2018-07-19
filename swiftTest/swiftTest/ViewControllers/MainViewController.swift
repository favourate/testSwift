//
//  MainViewController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSourceArr: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "主页"
        
        self.dataSourceArr = [["title":"张三","desc":"清华大学"],
                              ["title":"李四","desc":"北京大学"],
                              ["title":"王五","desc":"南京大学"],
                              ["title":"赵四方","desc":"野鸡大学"],
                              ["title":"诸葛亮","desc":"家里蹲大学"],
                              ["title":"张飞","desc":"小学生"],
                              ["title":"关羽","desc":"不上学"],
                              ["title":"曹操","desc":"哈佛商学院"]]
        
        self.tableView.estimatedRowHeight = 0
        self.tableView.register(UINib.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCellID")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
}


extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCellID") as! MainTableViewCell
        let dic = self.dataSourceArr[indexPath.row] as! NSDictionary
        cell.titleLab.text = dic["title"] as? String
        cell.descLab.text = dic["desc"] as? String
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}






