//: Playground - noun: a place where people can play

import UIKit
// OC -> NSSting 是对象
// Swift -> String 结构体
var str : String = "yhp "

// 拼接
var str2 = "cool"
str += str2
// 格式化
// \() 拼接字符串
let num = 10
let name = "yhp"
var str3 = "name = \(name),age = \(num)"
var str4 = String(format: "%02d,%02d,%02d", arguments: [11,2,7])

// 截取
// 建议使用OC的方法，swift 比较麻烦
var str5 : NSString = "yhp nb"
var str6 = "yhp nb" as NSString
var substr = str5.substring(with: NSMakeRange(1, 4))
// swift 字符串直接遍历
for c in str.characters{
    print(c)
}
