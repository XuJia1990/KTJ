//
//  PersonRegisterViewController.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/12.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class PersonRegisterViewController: UIViewController {
    
    @IBOutlet weak var personAccountIDLable: UILabel!
    @IBOutlet weak var personPasswordLable: UILabel!
    @IBOutlet weak var personCheckPasswordLable: UILabel!
    @IBOutlet weak var personPhoneLable: UILabel!
    @IBOutlet weak var personPostLable: UILabel!
    @IBOutlet weak var personPostNumLable: UILabel!
    @IBOutlet weak var personAddressLable: UILabel!
    @IBOutlet weak var personAccountIDTextFiled: UITextField!
    @IBOutlet weak var personPwdTextFiled: UITextField!
    @IBOutlet weak var personCheckPwdTextFiled: UITextField!
    @IBOutlet weak var personPhoneTextFiled: UITextField!
    @IBOutlet weak var personPostTextFiled: UITextField!
    @IBOutlet weak var personPostNumTextFiled: UITextField!        
    @IBOutlet weak var personAddressTextFiled: UITextField!
    var flagPerson : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if(flagPerson == "1"){
            self.title = "个人注册"
        }else{
            self.title = "店铺注册"
        }
        
        //编辑时设置删除记号
        self.personAccountIDTextFiled.clearButtonMode = .whileEditing
        self.personPwdTextFiled.clearButtonMode = .whileEditing
        self.personCheckPwdTextFiled.clearButtonMode = .whileEditing
        self.personPhoneTextFiled.clearButtonMode = .whileEditing
        self.personPostTextFiled.clearButtonMode = .whileEditing
        self.personPostNumTextFiled.clearButtonMode = .whileEditing
        self.personAddressTextFiled.clearButtonMode = .whileEditing        
    }
    
    //个人注册成功，跳转至登录画面
    @IBAction func clickPersonRegister(_ sender: Any) {
        
        //点击注册后，触发弹窗事件:确认或取消
        let alertRegistr = UIAlertController.init(title: "提示信息", message: "请问是否确认注册信息", preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .default) { (_) in
            //调用数据存储方法
            self.dataStorage()
            //确认注册之后，跳转
            self.dismiss(animated: true, completion: nil)
        }
        let alertCancle = UIAlertAction(title: "CANCLE", style: .cancel) { (_) in
        }
        alertRegistr.addAction(alertOK)
        alertRegistr.addAction(alertCancle)
        self.present(alertRegistr, animated: true, completion: nil)
        
    }

    //数据存储
    func dataStorage() {

        //创建存储对象
        let userDefault = UserDefaults.standard
        
        //数据存储
        let dict: [String: String] = ["accountId":personAccountIDTextFiled.text!,
                                      "password":personPwdTextFiled.text!,
                                      "phone":personPhoneTextFiled.text!,
                                      "post":personPostTextFiled.text!,
                                      "postNumber":personPostNumTextFiled.text!,
                                      "address":personAddressTextFiled.text!,
                                      "flagTemp":flagPerson,]

        userDefault.set(dict, forKey: personAccountIDTextFiled.text!)
    }
        
    //返回按钮事件
    @IBAction func clickBackHomepage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
