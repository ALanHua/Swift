//
//  CityCellTableViewCell.swift
//  UITableViewDemo
//
//  Created by yhp on 15/9/22.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class CityCellTableViewCell: UITableViewCell {

    var cityLabel: UILabel?
    var cityTextFieldd: UITextField?
    var citySwitch: UISwitch?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        初始化子视图
        cityLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 80, height: 40))
        cityTextFieldd = UITextField(frame: CGRect(x: 90, y: 5, width: 80, height: 40))
        citySwitch = UISwitch(frame: CGRect(x: 200, y: 5, width: 80, height: 40))
        self.addSubview(cityLabel!)
        self.addSubview(cityTextFieldd!)
        self.addSubview(citySwitch!)
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
