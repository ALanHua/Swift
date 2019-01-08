//
//  main.swift
//  AdvanceSwift_14
//
//  Created by yhp on 2019/1/7.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

// Variable Scope and Lifetime
// Global variables
let globalVariable = "global"
class Dog {
    func printGlobal() {
        print(globalVariable)
    }
}
// Properties
class Dog2 {
    static let staticProperty = "staticProperty"
    let instanceProperty = "instanceProperty"
    func printInstanceProperty() {
         print(self.instanceProperty)
    }
    // Local variables
    func printLocalVariable() {
        let localVariable = "local"
        print(localVariable)
    }
}

class Cat {
    func printDogStaticProperty() {
        print(Dog2.staticProperty)
    }
    func printDogInstanceProperty() {
        let d = Dog2()
        print(d.instanceProperty)
    }
}

// Computed Variables
// 注意点：必须定义成可变,当只有get方法时,属性为只读
// 且只有get方法是get关键字可以省略
var now : String {
    get {
        return Data().description
    }
    set{
        print(newValue)
    }
}

now = "Howdy"
print(now)

private var _myBigData:Data! = nil
var myBigData : Data! {
    set(newdata){
        _myBigData = newdata
    }
    get{
        return _myBigData
    }
}

// Setter Observers
var s = "whatever" {
    willSet{
        print(newValue)
    }
    didSet{
        print(oldValue)
    }
}

// Lazy Initialization
class MyClass {
//   单例
    static let sharedSimgleton = MyClass()
    private init(){}
}

// string
let s1 = "hello"
let s2 = "world"
let space = " "
let greeting = [s1,s2].joined(separator: space)
print(greeting)

let i = 7
let s3 = String(i)
print(s3)
let i1 = 31
// 转换成16进制形式的字符串
let s4 = String(i1,radix:16)
print(s4)

func flag(country: String) -> String {
    let base: UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
}
print(flag(country: "DE"))
