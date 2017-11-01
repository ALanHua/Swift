//
//  main.swift
//  10_literal
//
//  Created by yhp on 2017/11/1.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let aNumber = 3
let aString = "Hello"
let aBool = true
let anArray = [1,2,3]
let aDictinoary = ["key1": "value1", "key2": "value2"]

enum MyBool :Int{
    case myTrue,myFalse
}

extension MyBool:ExpressibleByBooleanLiteral{
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
}

let myTrue:MyBool = true
let myFalse:MyBool = false

print(myTrue.rawValue)
print(myFalse.rawValue)

class Person :ExpressibleByStringLiteral{
    let name :String
    init(name value:String) {
        self.name = value
    }
    required convenience init(stringLiteral value: String) {
        self.init(name: value)
    }
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }
    
    required convenience init(unicodeScalarLiteral value: String) {
        self.init(name: value)
    }
}

let p:Person = "xiaoming"
print(p.name)


