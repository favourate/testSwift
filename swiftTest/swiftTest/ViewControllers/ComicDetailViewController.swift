//
//  ComicDetailViewController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit
import SwiftyJSON
class ComicDetailViewController: BaseViewController {

 
    var comicId:Int?
    var dataSourceArr :NSMutableArray = NSMutableArray()
    
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        self.dataFromSever()
        
        if NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_9_0 {
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.alpha = 0
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
   
    
    private func dataFromSever()->Void{
        NetWorkManager.getMethodNetWorkWith(URL: String(format: "topics/%ld", comicId!), Parameter: [:], success: { (successHandler) in
            
            print(successHandler)
            self.imgView.sd_setImage(with: URL(string: successHandler["data" ,"vertical_image_url"].stringValue), completed: nil)
            
            self.dataSourceArr = NSMutableArray.init(array: successHandler["data","comics"].arrayValue)
            
            self.tableView.reloadData()
            
        }) { (failureHandler) in
            
        }
        
    }
    @objc  func clickBtn(btn : UIButton){
    }

    
    lazy var tableView:UITableView = {
        var table = UITableView.init(frame:CGRect.init(x: 0, y: 0, width: KScreenW, height: KScreenH))
        table.estimatedRowHeight = 0;
        table.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        table.delegate = self
        table.backgroundColor = UIColor.clear
        table.dataSource = self
        table.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
//        table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        
        table.register(UINib.init(nibName: "ComicListTableViewCell", bundle: nil), forCellReuseIdentifier: "ComicListTableViewCellID")
        let headerView : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenW, height: 40))
        headerView.backgroundColor = UIColor.clear
        let btn:UIButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: KScreenW, height: 40))
        btn.addTarget(self, action: #selector(clickBtn(btn:)), for: UIControlEvents.touchUpInside)
        btn.setTitle("点我转换顺序", for: UIControlState.normal)
        btn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        headerView.addSubview(btn)
        table.tableHeaderView = headerView
        return table
    }()
 

}




extension ComicDetailViewController : UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ComicListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ComicListTableViewCellID") as! ComicListTableViewCell
   
        cell.cellWithModel(param: self.dataSourceArr[indexPath.row] as! JSON)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        let contentY : CGFloat = scrollView.contentOffset.y
        
        if contentY < -200 {
            let scale = (-contentY - 288) * 0.01 + 1;
            self.imgView.transform = CGAffineTransform.init(scaleX: scale, y: scale)
            self.navigationController?.navigationBar.alpha = 0
        }else
        {
            if contentY >= -200 && contentY < -160{
                self.navigationController?.navigationBar.alpha = (contentY - 220)/40
            }else
            {
                self.navigationController?.navigationBar.alpha = 1
            }
            
        }
        
        
    }
    
}
