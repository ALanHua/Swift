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
// Set
struct Person: Hashable {
    let firstName : String
    let lastName : String
}

let set: Set<Int> = [1,2,3,4,5]
let set2 = Set(set.map{ $0 + 1})
print(set2)
let set3 = set.filter { $0 > 3}
print(set3)
/**
 集合间的操作
*/
var setA: Set<String> = ["Swift","Object-C"]
var setB: Set<String> = ["HTML","CSS","JS"]
var setC = Set(["Swift","HTML","CSS"])
var setD: Set<String> = ["Swift"]
/*
 并集操作:
     union()     不影响源有集合
     formUnion() 影响源有集合
 */
let set4 = setA.union(setB) // 创建新集合
print(setA)
setA.formUnion(setB)
print(setA)
/*
 集合的交集操作
     intersection()      不影响源有集合
     formIntersection()  影响源有集合
 */
let set5 = setA.intersection(setC)
print(setA)
setA.formIntersection(setC)
print(setA)
/*
 集合的差集操作
 名词说明: 差集就是说两个集合中一个集合有，但另一个集合里没有
    subtracting      不影响源有集合
    subtract         影响源有集合
 */
let set6 = setB.subtracting(setC)
print(setB)
setB.subtract(setC)
print(setB)

/**
 集合的抑或操作
     就是在一个集合中但不在两个集合中的值创建一个新的集合
     symmetricDifference()      不影响源有集合
     formSymmetricDifference()   影响源有集合
 */
let set7 = setC.symmetricDifference(setD)
print(setC)
setC.formSymmetricDifference(setD)
print(setC)
/**
 集合的子集、真子集判断
    isSubset        判断一个集合中的值是否也被包含在另外一个集合中。
    isStrictSubset  判断一个集合是否是另外一个集合的子集合，并且两个集合并不相等
 */
var result = setD.isSubset(of: setA)
print("setD\(setD),setA\(setA)")
print(result)
result = setD.isStrictSubset(of: setA)
print(result)

/*
 集合的超集、超子集判断
    isSuperset
    isStrictSuperset
 */
result = setA.isSuperset(of: setD)
print("setA\(setA),setD\(setD)")
print(result)
result = setA.isStrictSuperset(of: setD)
print(result)

/**
 集合的相离判断
    判断两个集合毫无相同的元素
    isDisjoint
 */
result = setA.isDisjoint(with: setB)
print("setA\(setA),setB\(setB)")
print(result)

//  Option sets
// Flow Control and More
var i = 10
switch i {
case 1:
    print("You have 1 thingy!")
case 2...10:
    print("You have \(i) thingies!")
default:
    print("You have more thingies than I can count!")
}

// Optional
let i1 : Int? = 2
switch i1 {
case 1?:
     print("You have 1 thingy!")
case let n?:
    print("You have \(n) thingies!")
case nil:break
}

func position(for bar: String) -> String {
    switch true {
    case bar == "123":
        return "你好"
    default:
        return "什么都没有"
    }
}
switch i {
case let j where j < 0:
    print("i is negative")
case let j where j > 0:
    print("i is positive")
case 0:
     print("i is 0")
default:break
}
// 同上
switch i {
case ..<0:
    print("i is negative")
case 1...:
    print("i is positive")
case 0:
    print("i is 0")
default:break
}

let dict : [String:Any] = ["size":1,"desc":"apple"]

switch (dict["size"], dict["desc"]){
case let (size as Int,desc as String):
     print("You have size \(size) and it is \(desc)")
default:break
}

enum Filter {
    case albums
    case playlists
    case podcasts
    case books
}

let type = Filter.albums
switch type {
case .albums:
    print("Albums")
case .playlists:
    print("playlists")
case .podcasts:
    print("podcasts")
case .books:
    print("books")
}

// extract an associated value from an enum case.
enum MyError {
    case number(Int)
    case message(String)
    case fatal
}

let err = MyError.number(20)

switch err {
case .number(let theNumber):
    print("It is a number: \(theNumber)")
case let .message(theMessage):
    print("It is a message: \(theMessage)")
case .fatal:
    print("It is fatal")
}
// To combine switch case tests (with an implicit logical-or), separate them with a comma
switch i {
case 1,3,5,7,9:
    print("You have a small odd number of thingies.")
case 2,4,6,8,10:
    print("You have a small even number of thingies.")
default:
    print("You have too many thingies for me to count.")
}
// fallthrough
let pep = "Manny"
switch pep{
case "Manny":fallthrough
case "Moe":fallthrough
case "Jack":
    print("\(pep) is a Pep boy")
default:
    print("I don't know who \(pep) is")
}

// if case

