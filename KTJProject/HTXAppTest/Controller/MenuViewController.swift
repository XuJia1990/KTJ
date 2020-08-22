//
//  MenuViewController.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/18.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet weak var menuTableView: UITableView!
    let cellIdMenu = "Menu"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "漢亭序"
        //设置代理
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        //修改导航栏返回Button的默认Title
        self.navigationController?.navigationBar.topItem?.title = "返回"
        //设置导航栏右边提交按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .plain, target: self, action: #selector(submitButton))
        
        //创建Xib对象
        let menuXib = UINib.init(nibName: "MenuTableViewCell", bundle: nil)
        //menuTableView注册XIB
        menuTableView.register(menuXib, forCellReuseIdentifier: "cellIDTwo")
    }
    
    //懒加载读取menuJson数据
    lazy var menuArray : [MenuData] = {
        //定义临时数组
        var menuTempArray : [MenuData] = []
        //获取json路径
        let path = Bundle.main.path(forResource: "Menu", ofType: "json")
        //获取数据
        if let menuJsondata = try? Data(contentsOf: URL(fileURLWithPath: path!)){
            do {
                //Json数据转化成字典键值形
                if let menuJsonObject : NSDictionary = try JSONSerialization.jsonObject(with: menuJsondata, options: .allowFragments) as? NSDictionary {
                    //依据key值，获得value，并且将value值转化成另一个字典对象
                    if let menuNameArray : [Any] = menuJsonObject["Menus"] as? [Any] {
                        // 数组遍历
                        for dict in menuNameArray {
                            let menuContentDatas : MenuData = MenuData.init(dict: dict as! NSDictionary)
                            menuTempArray.append(menuContentDatas)
                        }
                    }
                }
            } catch  {
                print("error...")
            }
        }
        return menuTempArray
    }()
    
    //返回sections组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuArray.count
    }
    //返回每组 的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let menu: MenuData = menuArray[section]
        return menu.menuContentData!.count
    }
    //cell内容设置
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //创建缓存池
        var cell : MenuTableViewCell? = menuTableView.dequeueReusableCell(withIdentifier: "cellIDTwo") as? MenuTableViewCell
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellIDTwo") as? MenuTableViewCell
        }
        //cell高度设置,去除分割线
        self.menuTableView.rowHeight = 80
        menuTableView.separatorStyle = .none
        //获取MenuContentData数据
        let menuData : MenuContentData = menuArray[indexPath.section].menuContentData![indexPath.row]
        cell?.menuImageView?.image = UIImage(named: menuData.menuImage!)
        cell?.menuLable.text = menuData.menuSetDericripe
        cell?.checkButton.backgroundColor = menuData.selectedButton ? .gray : .white
        cell?.checkButton.isSelected = menuData.selectedButton
        return cell!
    }
    //button选中时设置
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //获取MenuContentData数据
        let menuData : MenuContentData = menuArray[indexPath.section].menuContentData![indexPath.row]
        menuData.selectedButton = !menuData.selectedButton
        tableView.reloadData()
    }
    
    //sectionTitle设置
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuArray[section].menuName
    }
    
    //返回sectionTitle高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    //提交按钮事件,跳转至订单页面
    @objc func submitButton() {
        let vcOrderPage = OrderPageViewController()
        self.navigationController?.pushViewController(vcOrderPage, animated: true)
    }
    
    
}
