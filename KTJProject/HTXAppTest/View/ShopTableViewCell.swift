//
//  ShopTableViewCell.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/17.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var imageCellView: UIImageView!
    
    @IBOutlet weak var shopDecLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //UIView的悬浮设置
        self.shadowView.layer.shadowColor = UIColor.red.cgColor
        self.shadowView.layer.shadowOpacity = 0.5
        self.shadowView.layer.shadowOffset = CGSize(width: 8, height: 8)
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
