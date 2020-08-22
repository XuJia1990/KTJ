//
//  ViewController.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/12.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var accountIDLable: UILabel!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var accountIDTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        label2.text = "1234"
        view.addSubview(label2)
        
        let labelInn = UILabel()
        labelInn.frame = CGRect(x: 0, y: 30, width: 200, height: 60)
        labelInn.text = "inn"
        view.addSubview(labelInn)
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        button.addTarget(self, action: #selector(loginButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        //textFiled入力框添加编辑时删除记号
        self.accountIDTextFiled.clearButtonMode = .whileEditing
        self.passwordTextFiled.clearButtonMode = .whileEditing
    }
    
    //登录按钮事件
    @IBAction func loginButton(_ sender: Any) {
        
        //获取存储数据
        let dict : [String : String] = UserDefaults.standard.value(forKey: self.accountIDTextFiled.text!) as! [String : String]
        let accountID = dict["accountId"]
        let password = dict["password"]
        if dict.isEmpty {//字典为空
            //用户名和密码不存在，触发弹窗提示
            let alertLogin = UIAlertController.init(title: "提示信息", message: "该用户不存在，请注册登录", preferredStyle: .alert)
            let actionOK = UIAlertAction.init(title: "OK", style: .default) { (_) in
            }
            //添加事件
            alertLogin.addAction(actionOK)
            self.present(alertLogin, animated: true, completion: nil)
            
        }else if(self.accountIDTextFiled.text != accountID || self.passwordTextFiled.text != password){//登录用户名和密码与存储对象的值不等时，提示错误信息
            //用户名或密码错误，触发弹窗提示
            let alertLogin = UIAlertController.init(title: "提示信息", message: "用户名或者密码错误，请确认你的用户名与密码", preferredStyle: .alert)
            let actionOK = UIAlertAction.init(title: "OK", style: .default) { (_) in
            }
            //添加事件
            alertLogin.addAction(actionOK)
            self.present(alertLogin, animated: true, completion: nil)
            
        } else {//用户名和密码输入正确，跳转至首页
            
            //实例化跳转对象
            let vcHomePage = HomePageViewController()
            //创建导航栏控制器
            let naviHomePage : UINavigationController = UINavigationController(rootViewController: vcHomePage)
            //防止颜色渲染
            naviHomePage.navigationBar.isTranslucent = false
            naviHomePage.tabBarItem = UITabBarItem(title: "店铺", image: nil, tag: 1)
            naviHomePage.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)], for: .normal)
            
            let vcUserPage = UserPageViewController()
            let naviUserPage : UINavigationController = UINavigationController(rootViewController: vcUserPage)
            naviUserPage.navigationBar.isTranslucent = false
            naviUserPage.tabBarItem = UITabBarItem(title: "用户", image: nil, tag: 2)
            naviUserPage.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)], for: .normal)
            
            let vcOrderPage = OrderPageViewController()
            let naviOrderPage  = UINavigationController(rootViewController: vcOrderPage)
            naviOrderPage.navigationBar.isTranslucent = false
            naviOrderPage.tabBarItem = UITabBarItem(title: "订单", image: nil, tag: 3)
            naviOrderPage.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)], for: .normal)
            
            let tabbar = UITabBarController()
            tabbar.viewControllers = [naviHomePage,naviUserPage,naviOrderPage]
            tabbar.tabBar.isTranslucent = false
            print(tabbar.tabBar.bounds.size.height)
            //将登录ID传值至UserPageViewController
            vcUserPage.tempAccountID = dict["accountId"]!
            //设置整个tabBar区域的背景色
            tabbar.tabBar.tintColor = .orange
            //实现跳转
            self.present(tabbar, animated: true, completion: nil)
        }
    }
    
    //个人注册登录
    @IBAction func personRegisterButton(_ sender: Any) {
        //创建跳转的ViewController对象
        let vcPerson = PersonRegisterViewController()
        vcPerson.flagPerson = "1"
        //创建导航栏控制器
        let naviPerson : UINavigationController = UINavigationController(rootViewController: vcPerson)
        //防止颜色渲染
        naviPerson.navigationBar.isTranslucent = false
        //实现跳转
        self.present(naviPerson, animated: true, completion: nil)
        
    }
    
    //店铺注册登录
    @IBAction func shopRegiserButton(_ sender: Any) {
        //创建跳转的ViewController对象
        let vcPerson = PersonRegisterViewController()
        vcPerson.flagPerson = "0"
        //创建导航栏控制器
        let naviPerson : UINavigationController = UINavigationController(rootViewController: vcPerson)
        //防止颜色渲染
        naviPerson.navigationBar.isTranslucent = false
        //实现跳转
        self.present(naviPerson, animated: true, completion: nil)
    }
    
}

