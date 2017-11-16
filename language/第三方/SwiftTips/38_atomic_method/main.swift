//
//  main.swift
//  38_atomic_method
//
//  Created by yhp on 2017/11/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class MyClass {
    func method(number:Int) -> Int {
        return number + 1
    }
    
    class func method(number:Int) -> Int{
        return number
    }
}

//let object = MyClass()
//let result = object.method(number: 1)
//print(result)
//let f = MyClass.method
//let object = MyClass()
//let result = f(object)(1)
//print(result)
let f1 = MyClass.method
let f2:(Int) -> Int = MyClass.method
let f3:(MyClass) -> (Int) -> (Int) = MyClass.method
let object = MyClass()
var result = f1(1)
print(result)
result = f2(1)
print(result)
result = f3(object)(1)
print(result)







