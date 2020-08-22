//
//  UserPageViewController.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/12.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController {
    
    @IBOutlet weak var accountIdLable: UILabel!
    //定义变量接收登录画面的传值 accountID
    var tempAccountID : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "用户"

        //获取登录的AccountID
        let accountID = tempAccountID
        accountIdLable.text?.append(accountID)
    }
    
    //跳转至个人信息修改
    @IBAction func UserModifyButton(_ sender: Any) {
        
        //创建跳转ViewController对象
        let vcModify = ModifyViewController()

        vcModify.tempAccountID2 = tempAccountID
        //实现跳转
        self.navigationController?.pushViewController(vcModify, animated: true)
    }
    //跳转至店铺信息修改
    @IBAction func ShopModifyButton(_ sender: Any) {
        //创建跳转ViewController对象
        let vcModify = ModifyViewController()

        vcModify.tempAccountID2 = tempAccountID
        //实现跳转
        self.navigationController?.pushViewController(vcModify, animated: true)
    }
    
    //退出至登录首页
    @IBAction func BackToHomepage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
