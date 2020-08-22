//
//  MenuTableViewCell.swift
//  HTXAppTest
//
//  Created by 尹嘉辉 on 2020/8/18.
//  Copyright © 2020 尹嘉辉. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLable: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //button可点击
        checkButton.isEnabled = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //checkBoxButton点击事件
    @IBAction func checkBoxButton(_ sender: Any) {
    }

    
}
