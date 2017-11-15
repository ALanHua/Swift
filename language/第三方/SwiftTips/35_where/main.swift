//
//  main.swift
//  35_where
//
//  Created by yhp on 2017/11/15.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let name = ["王小二","张三","李四","王二小"]

name.forEach {
    switch $0 {
        case let x where x.hasPrefix("王"):
        print("\(x)是资本家")
        default:
        print("你好，\($0)")
    }
}

let num:[Int?] = [48,99,nil]
let n = num.flatMap { $0 }
print(n)
for score in n where score > 60 {
    print("及格-\(score)")
}
print("------------")
num.forEach {
    if let score = $0 ,score > 60 {
       print("及格-\(score)")
    }else{
        print(":(")
    }
}

let sortableArray:[Int] = [3,1,2,4,5]
let unsortableArray:[Any?] = ["Hello",4,nil]
print(sortableArray.sorted())












