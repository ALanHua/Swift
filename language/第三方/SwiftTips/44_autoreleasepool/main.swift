//
//  main.swift
//  44_autoreleasepool
//
//  Created by yhp on 2017/11/17.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

// 可以使用 autoreleasepool(invoking: <#T##() throws -> Result#>) 函数自动释放池子
class MyObject {
    var num = 0
}

var myObject = MyObject()
var a = [myObject]
var b = a
b.append(myObject)
myObject.num = 100
print(b[0].num)
print(b[1].num)
print(b.count)



