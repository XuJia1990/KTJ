//
//  MenuDataModel.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/18.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import Foundation
 
class MenuData : NSObject {
    var menuName : String?
    var menuContentData : [MenuContentData]?
    
    init(dict : NSDictionary) {
        self.menuName = dict["menuName"] as? String
        let tempMenuData: [[String: String]] = dict["menuContent"] as! [[String: String]]
        var tempMenu: [MenuContentData] = []
        for dict in tempMenuData {
            let menu : MenuContentData = MenuContentData.init(dict: dict as NSDictionary)
            tempMenu.append(menu)
        }
        self.menuContentData = tempMenu
    }
}



class MenuContentData : NSObject {
    var menuImage : String?
    var menuSetDericripe : String?
    var selectedButton : Bool = false
    
    init(dict : NSDictionary) {
        self.menuImage = dict["menuImage"] as? String
          self.menuSetDericripe = dict["menuSetDericripe"] as? String

    }
}
