//
//  ComicListViewController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit
import SwiftyJSON
class ComicListViewController: BaseViewController {

    
    var dataSourceArr:NSMutableArray = NSMutableArray()
    var count:Int = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "列表页"
        tableView.register(UINib.init(nibName: "ComicListTableViewCell", bundle: nil), forCellReuseIdentifier: "ComicListTableViewCellID")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.estimatedRowHeight = 0
        
        self.dataFromSever()
    }

    
    private func dataFromSever() ->Void{
        
        NetWorkManager.getMethodNetWorkWith(URL: String(format: "topics/search"), Parameter: ["offset": 0,"limit":20,"keyword":"恋爱"], success: { (successHandler) in
        
            print(successHandler["data"]["topics"])
            self.dataSourceArr.addObjects(from: successHandler["data"]["topics"].arrayValue)
//            print(self.dataSourceArr)
            self.tableView.reloadData()
            
        }) { (failureHandler) in
            
        }
    }
    
}


extension ComicListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ComicListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ComicListTableViewCellID") as! ComicListTableViewCell
        count = count + 1
        print(count)
        cell.cellWithModel(param: self.dataSourceArr[indexPath.row] as! JSON)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var param : JSON = self.dataSourceArr[indexPath.row] as! JSON
        
        let detailVC: ComicDetailViewController = ComicDetailViewController()
        
        detailVC.comicId = param["id"].intValue
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
