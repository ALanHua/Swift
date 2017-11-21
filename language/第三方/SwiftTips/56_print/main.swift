//
//  main.swift
//  56_print
//
//  Created by yhp on 2017/11/20.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let a = 3
let b = 1.234667
let c = "Hello"
print("\(a),\(b),\(c)")

let format = String(format: "%.2f", b)
print("\(format)")
extension Double {
    func format(_ f:String) -> String {
        return String(format: "%.\(f)f", self)
    }
}
let f = "2"
print("\(b.format(f))")

struct Meeting {
    var date: NSDate
    var place: String
    var attendeName:String
}
extension Meeting:CustomStringConvertible{
    var description: String{
        return "于\(self.date)在\(self.place)与\(self.attendeName) 进行会议"
    }
}

let meeting = Meeting(date: NSDate(), place: "会议室", attendeName: "小明")
print(meeting)






