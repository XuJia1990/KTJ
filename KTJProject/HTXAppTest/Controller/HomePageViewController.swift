//
//  HomePageViewController.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/12.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet weak var shopTableView: UITableView!
    let cellId = "Shop"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "店铺"
        //设置代理
        shopTableView.dataSource = self
        shopTableView.delegate = self
        
        //创建XIB对象
        let shopXIB = UINib.init(nibName: "ShopTableViewCell", bundle: nil)
        //为tableView注册cell
        shopTableView.register(shopXIB, forCellReuseIdentifier: "cellID")
        
    }
    //读取json数据
    lazy var shopJsonArray :[Any] = {
        var tempArray : [ShopDataContent] = []
        //获取json文件路径
        let path = Bundle.main.path(forResource: "Shop", ofType: "json")
        //获取数据
        if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path!)) {
            do {
                // 将json数据转换为字典对象
                if let jsonObject : NSDictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? NSDictionary {
                    // 根据键名，获得字典对象中的键值，并将键值转化为另一个字典对象
                    if let shopNameArray : [Any] = jsonObject["shops"] as? [Any] {
                        for dict in shopNameArray {
                            let shopData: ShopDataContent = ShopDataContent.init(dict: dict as! NSDictionary)
                            tempArray.append(shopData)
                        }
                    }
                }
            } catch {
                print("error...")
            }
        }
        return tempArray
    }()
    
    //返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return shopJsonArray.count
    }
    //返回每组的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //创建缓存池
        var cell : ShopTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellID") as? ShopTableViewCell
        if cell == nil {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cellID") as? ShopTableViewCell
        }
        //设置cell高度
        self.shopTableView.rowHeight = UIScreen.main.bounds.height
        //获取屏幕高度，宽度
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        //设置大小
        cell?.shadowView.frame = CGRect(x: 0, y: 0, width: width , height: height)
        cell?.imageCellView.frame = CGRect(x: 0, y: 0, width: width - 20 , height: height * 0.5 - 64 - 49)
        cell?.shopDecLable.frame = CGRect(x: 0, y: height * 0.5, width: width , height: height * 0.5 - 64 - 49)
        //获取section的内容
        let shopData: ShopDataContent = shopJsonArray[indexPath.section] as! ShopDataContent

        cell?.imageCellView.image = UIImage(named: (shopData.shopContent?.shopImage)!)
        cell?.shopDecLable.text = shopData.shopContent?.shopDericripe
      
        return cell!
        
    }
    
    //cell添加点击跳转事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuVc = MenuViewController()
        //实现跳转
        self.navigationController?.pushViewController(menuVc, animated: true)
        
    }
    
}
