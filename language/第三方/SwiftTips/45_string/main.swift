//
//  main.swift
//  45_string
//
//  Created by yhp on 2017/11/17.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let level = "ABCDE"
for i in level {
    print(i)
}
#if swift(>=3.0)
if level.contains("BC") {
    print("包含字符串")
}
#else
    if (level as NSString).contains("BC") {
        print("包含字符串")
    }
#endif

let levels = "ABCDE"
let nsRange = NSMakeRange(1, 4)
//levels.replacingCharacters(in: nsRange, with: "AAAA")
let indexPositionOne = levels.index(levels.startIndex, offsetBy: 1)
let swiftRange = indexPositionOne ..< levels.index(levels.startIndex, offsetBy: levels.count)
print(levels.replacingCharacters(in: swiftRange, with: "AAAA"))

// 将String 转换成NSString
let nsRange2 = NSMakeRange(1, 4)
print((levels as NSString).replacingCharacters(in: nsRange, with: "BBBB"))




















