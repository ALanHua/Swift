//
//  main.swift
//  AdvanceSwift_17
//
//  Created by yhp on 2019/3/9.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

// Dictionary 这种类型的集合数据是无序的
// 创建一个空字典
var d = [String:String]()
var d_2 : [String:String] = [:]

let abbrevs = ["CA", "NY"]
let names = ["California", "New York"]
let tuples = (abbrevs.indices).map {(abbrevs[$0],names[$0])}
let d_3 = Dictionary(uniqueKeysWithValues: tuples)
print(tuples)
print(d_3)
/*
还可以通过zip函数实现上述功能
*/
let tuples_2 = zip(abbrevs, names)
let d_4 = Dictionary(uniqueKeysWithValues: tuples_2)
print(d_4)
//  zip函数还有一个特性，如果其中一个序列长于另一个，多余部分会被舍弃
let r = 1...
let d_5 = Dictionary(uniqueKeysWithValues: zip(r, names))
print(d_5)
// Dictionary subscripting
let state = d_3["CA"]
print(state!)
// 如果没有给出一个默认值，而不是nil
let state_2 = d_3["MD",default:"N/A"]
print(state_2)

let sentence = "how much wood would a wood chuck chuck"
let words = sentence.split(separator: " ").map {String($0)}
print(words)
var d_6 = [String:Int]()
words.forEach {d_6[$0,default:0] += 1}
print(d_6)

let ones = Array(repeating: 1, count: words.count)
// 使用 init(_:uniquingKeysWith:) 方法初始化
let d_7 = Dictionary(zip(words,ones)){$0 + $1}
print(d_7)
// 修改字典中的数据
var d_8 = ["CA": "California", "NY": "New York"]
d_8["NY"] = nil
print(d_8)
// Dictionary casting and comparison
// Basic dictionary properties and enumeration
var d_9 = ["CA": "California", "NY": "New York"]
for s in d_9.keys {
    print("dictionary is \(s)")
}
var keys = Array(d_9.keys)
print(keys)

let d_10 : [String:Int] = ["one":1, "two":2, "three":3]
let keysSorted = d_10.keys.sorted()
print(keysSorted)
let arr = d_10.values.filter { $0 < 2}
print(arr)
let min = d_10.values.min()
print(min!)
let sum = d_10.values.reduce(0, +)
print(sum)
let ok = d_10.keys ==  ["one":1, "two":2, "three":3].keys
print(ok)

var d_11 = ["CA": "California", "NY": "New York"]
for (abbrev,state) in d_11 {
    print("\(abbrev) stands for \(state)")
}
// 或者
for pair in d_11 {
    print("\(pair.key) for \(pair.value)")
}
// 将字典类型转换成数组
// 这时候数组里存储的是元组类型
let arr_2 = Array(d_11)
print(arr_2)
// mapValues
let d_12 = d_11.filter { $0.value > "New Jersey"}.mapValues {$0.uppercased()}
print(d_12)
// merging
let d_13 = ["MD": "Maryland", "NY": "New York"]
let d_14 = d_11.merging(d_13) { (_,orig) in orig}
print(d_14)
let d_15 = d_11.merging(d_13) { (orig,_) in orig}
print(d_15)

// Swift Dictionary and Objective-C NSDictionary
