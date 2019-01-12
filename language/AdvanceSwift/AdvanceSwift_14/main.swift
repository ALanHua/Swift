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

let s5 = "hello world"
// String.capitalized 将字符串每个单词首字母大写
let s6 = s5.capitalized
print(s6)

let range = s5.range(of: "ell")
// Character and String Index
for c in s5 {
    print(c,terminator:"");
}

let c = Character("h")
let s7 = String(c).uppercased()
print(s7)
let c1 = s5.first
print(c1!)
let first = s5.firstIndex(of: "l")
print(first!.encodedOffset)
// prefix suffix
var s8 = String(s5.prefix(4))
print(s8)
print(String(s5.suffix(3)))
// 将字符串分割到数组
let arr = s5.split { $0 == " "}
print(arr)
/*
 string index ,swift的小标不是Int类型，不能
 像c语言那样访问
 */
let ix = s5.startIndex
print(ix.encodedOffset)
let ix2 = s5.index(ix, offsetBy: 1)
print(s5[ix2])
print(s5[s5.index(after: ix)])
let s9 = s5.dropFirst()
print(s9)
/*注意点：
 because s9 is a Sub‐ string pointing into the original "hello"
 because the index value is reckoned with respect to the original "hello".
 Substring 与 String 共享一个 Storage，这意味我们在操作 String 的一部分的时候，
 是不需要频繁的去创建内存的，这使得 Swift 4 的 String 相关的操作可以获取比较高的性能。
 只有当你显式地将 Substring 转成 String 的时候，才会 Copy 一份 String 到新的内存空间来，
 这时新的 String 和之前的 String 就没有关系了
 https://imtx.me/archives/2382.html
*/
let ix3 = s9.firstIndex(of: "o")
print(ix3!.encodedOffset)
var s10 = "hello"
let ix4 = s10.index(s10.startIndex, offsetBy: 1)
// 插入一个字符串到指定位置
s10.insert(contentsOf: "ey,h", at: ix4)
print(s10)

// Range
for ix in 1...3 {
    print(ix)
}

for ix in (1...3).reversed() {
    print(ix)
}
// use an Int Range as an index into that array
let s11 = "hello"
let arr11 = Array(s)
print(arr11)
let result = arr11[1...3]
print(result)
print(String(result))
let ix5 = s11.index(s11.startIndex, offsetBy: 1)
let ix6 = s11.index(ix5, offsetBy: 2)
print(s11[ix5...ix6])
// replaceSubrange and removeSubrange
var s12 = "hello"
let ix7 = s12.startIndex
let r = s12.index(ix7, offsetBy: 1)...s.index(ix7, offsetBy: 3)
s12.replaceSubrange(r, with: "ipp")
print(s12)
s12.removeSubrange(r)
print(s12)

