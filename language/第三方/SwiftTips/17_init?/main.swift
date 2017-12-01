//
//  main.swift
//  17_init?
//
//  Created by yhp on 2017/11/6.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

extension Int {
    init?(fromString:String) {
        self = 0
        var digit = fromString.count - 1
        for c in fromString {
            var number = 0
            if let n = Int((String(c))) {
                number = n
            }else{
                switch c {
                case "一":number = 1
                case "二":number = 2
                case "三":number = 3
                case "四":number = 4
                case "五":number = 5
                case "六":number = 6
                case "七":number = 7
                case "八":number = 8
                case "九":number = 9
                case "零":number = 0
                default:return nil
                }
            }
            self = self + number * Int(pow(10, Double(digit)))
            digit -= 1
        }
    }
}
let number1 = Int(fromString:"12")
print(number1!)
let number2 = Int(fromString:"七9八")
print(number2!)
