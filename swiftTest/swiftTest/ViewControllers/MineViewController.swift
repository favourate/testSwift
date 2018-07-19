//
//  MineViewController.swift
//  swiftTest
//
//  Created by Color on 2018/7/18.
//  Copyright © 2018年 李永兴. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var iconImg:UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        
        tableView.tableFooterView = UIView()
//        tableView.backgroundColor = UIColor.lightGray
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "MineHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "MineHeaderTableViewCellID")
        tableView.register(UINib.init(nibName: "MineSecondTableViewCell", bundle: nil), forCellReuseIdentifier: "MineSecondTableViewCellID")
    }

   lazy var dataSourceArr : NSMutableArray = {
        let dataArr: NSMutableArray = [["title":"我的收藏"],["title":"修改主题"],["title":"设置"]]
        return dataArr
    }()

}

extension MineViewController: UITableViewDataSource, UITableViewDelegate ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else
        {
            return dataSourceArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell : MineHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MineHeaderTableViewCellID") as! MineHeaderTableViewCell
            
            cell.iconBtn.setBackgroundImage(self.iconImg, for: UIControlState.normal)
            
            return cell
            
        }else{
            
            let cell : MineSecondTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MineSecondTableViewCellID") as! MineSecondTableViewCell
            let dic = self.dataSourceArr[indexPath.row] as! NSDictionary
            cell.titleLab.text = dic["title"] as? String
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                
                let imgPickVC :UIImagePickerController = UIImagePickerController.init()
                imgPickVC.sourceType = UIImagePickerControllerSourceType.photoLibrary
                weak  var delegate : (UIImagePickerControllerDelegate & UINavigationControllerDelegate)? = self
                imgPickVC.delegate = delegate
                self.navigationController?.present(imgPickVC, animated: true, completion: nil)
                
            }else{
                
                self .alertViewWithMessage(Message: "未打开相册权限") {
                    
                }
            }
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        print(pickImg)
        self.iconImg = pickImg
        self.tableView.reloadRows(at: [NSIndexPath.init(row: 0, section: 0) as IndexPath], with: UITableViewRowAnimation.none)
        picker.dismiss(animated: true, completion: nil)
    }
    
}


