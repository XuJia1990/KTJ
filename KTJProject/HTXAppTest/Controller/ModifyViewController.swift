//
//  ModifyViewController.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/13.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class ModifyViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var modifyAccountIdLable: UILabel!
    @IBOutlet weak var modifyPwdLable: UILabel!
    @IBOutlet weak var checkPwdLable: UILabel!
    @IBOutlet weak var modifyPhoneLable: UILabel!
    @IBOutlet weak var modifyPostLable: UILabel!
    @IBOutlet weak var modifyPostNumLable: UILabel!
    @IBOutlet weak var modifyAddressLable: UILabel!
    @IBOutlet weak var modifyAccountIdText: UITextField!
    @IBOutlet weak var modifyPwdText: UITextField!
    @IBOutlet weak var checkPwdText: UITextField!
    @IBOutlet weak var modifyPhoneText: UITextField!
    @IBOutlet weak var modifyPostText: UITextField!
    @IBOutlet weak var modifyPostNumText: UITextField!
    @IBOutlet weak var modifyAddressText: UITextField!
    var flagPerson : String!
    
    //定义变量接收登录画面的传值 accountID
    var tempAccountID2 : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置title
        if(flagPerson == "1"){
            self.title = "用户信息修改"
        }else{
            self.title = "店铺信息修改"
        }
        //修改导航栏返回Button的默认Title
        self.navigationController?.navigationBar.topItem?.title = "返回"
        //设置导航栏右边提交按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .plain, target: self, action: #selector(submitButton))
        
        //设置代理
        modifyAccountIdText.delegate = self
        modifyPwdText.delegate = self
        //获取存储的数据,显示
        self.modifyAccountIdText.text = tempAccountID2
        let dict: [String: String]? = UserDefaults.standard.value(forKey: self.modifyAccountIdText.text!) as? [String : String]
//        if flagPerson ==  dict?["address"]{
//            flagTemp
//        }
        modifyAccountIdText.text = dict?["accountId"]
        modifyPwdText.text = dict?["password"]
        checkPwdText.text = dict?["password"]
        modifyPhoneText.text = dict?["phone"]
        modifyPostText.text = dict?["post"]
        modifyPostNumText.text = dict?["postNumber"]
        modifyAddressText.text = dict?["address"]
        
    }
    
    //提交
    @objc func submitButton()  {
        
        //创建弹窗
        let alertSubmit = UIAlertController.init(title: "提示信息", message: "是否确认提交", preferredStyle: .alert)
        //点击确认
        let alertOK = UIAlertAction.init(title: "OK", style: .default) { (_) in
            //返回至用户页面
            self.modifyUserInfo()
            self.navigationController?.popViewController(animated: true)
        }
        //点击取消，返回至本页
        let alertCancle = UIAlertAction.init(title: "CANCLE", style: .cancel) { (_) in
        }
        //添加点击事件
        alertSubmit.addAction(alertOK)
        alertSubmit.addAction(alertCancle)
        //实现跳转
        self.present(alertSubmit, animated: true, completion: nil)
    }
    
    //textFiled限制长度 实现代理
    func textField(_ textFiled: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let lengthOfString :NSInteger = string.count
        
        let tempString : String = textFiled.text!
        
        let proposedNewLength : Int = tempString.count - range.length + lengthOfString
        
        let maxNum = 16
        //最大入力超过16位字符时，提示信息
        if (proposedNewLength > maxNum){
            let alertAlarm = UIAlertController.init(title: "提示", message: "最大输入字符16位", preferredStyle: .alert)
            let alertOK = UIAlertAction(title: "OK", style: .default) { (_) in
            }
            alertAlarm.addAction(alertOK)
            self.present(alertAlarm, animated: true, completion: nil)
            //return false//限制长度
        }
        return true
    }
    
    //信息修改
    func modifyUserInfo()  {
        //创建存储对象
        let userDefault = UserDefaults.standard
        //数据存储
        let dict: [String: String] = ["accountId":modifyAccountIdText.text!,
                                      "password":modifyPwdText.text!,
                                      "phone":modifyPhoneText.text!,
                                      "post":modifyPostText.text!,
                                      "postNumber":modifyPostNumText.text!,
                                      "address":modifyAddressText.text!,
                                      "flagTemp":flagPerson,]
        userDefault.set(dict, forKey: modifyAccountIdText.text!)
        
    }
    
}
