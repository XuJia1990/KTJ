//
//  ShopDataModel.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/18.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import Foundation

//shop
class ShopDataContent: NSObject {
    var shopId: String?
    var shopName: String?
    var shopContent: ShopDes?
    
    init(dict: NSDictionary) {
        self.shopId = dict["shopId"] as? String
        self.shopName = dict["shopName"] as? String
        let shop: ShopDes =  ShopDes.init(dict: dict["shopContent"] as! NSDictionary)
        self.shopContent = shop
    }
}

class ShopDes: NSObject {
    var shopImage: String?
    var shopDericripe: String?
    
    init(dict: NSDictionary) {
        self.shopImage = dict["shopImage"] as? String
        self.shopDericripe = dict["shopDericripe"] as? String
    }
}



