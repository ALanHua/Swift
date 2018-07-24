//
//  main.swift
//  71_dateToString
//
//  Created by yhp on 2018/7/24.
//  Copyright © 2018年 YouHuaPei. All rights reserved.
//

import Foundation

let currentdate = Date()
let dateformatter = DateFormatter()
dateformatter.dateStyle = .full
dateformatter.timeStyle = .long
let dateString = dateformatter.string(from: currentdate)
print(dateString)
// MARK: 自定义模式
dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
let customDate = dateformatter.string(from: currentdate)
print(customDate)
// MARK: 拆分Date
let calendar = Calendar.current
var dateComponents = calendar.dateComponents([.year,.month, .day, .hour,.minute,.second], from: currentdate)
//  设置时区
dateComponents.timeZone = TimeZone(abbreviation: "NZDT")
print("\(dateComponents.hour!),\(dateComponents.minute!),\(dateComponents.second!)")





