//
//  main.swift
//  25_Self_Protocol
//
//  Created by yhp on 2017/11/9.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation


/// Self不仅仅指代该协议类型本身，也包括这个类型的子类
protocol internalType {
    func clamp(intervalToClamp:Self) -> Self
}

protocol Copyable {
    func copy() -> Self
}

class MyClass: Copyable {
    var num = 1
    required init(){
        
    }
    func copy() -> Self {
        let result = type(of:self).init()
        result.num = num
        return result
    }
}

let object = MyClass()
object.num = 100
let newObject = object.copy()
object.num = 1
print(object.num)
print(newObject.num)




