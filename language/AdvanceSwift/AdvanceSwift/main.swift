//
//  main.swift
//  AdvanceSwift
//
//  Created by yhp on 2018/9/2.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

let fibs = [0,1,1,2,3,5]
var mutableFibs = [0,1,1,2,3,5]
mutableFibs.append(8)
mutableFibs.append(contentsOf: [13,21])
print(mutableFibs)
var x = [1,2,3]
var y = x
y.append(4)
print("\(x),\(y)")
// 对比一下Foundation 框架中的NSArray
let a = NSMutableArray(array: [1,2,3])
let b:NSArray = a // 此时b 引用这a,浅copy
a.insert(4, at: 3)
print("\(b)")
let c = NSMutableArray(array: [1,2,3])
let d = c.copy() as! NSArray
c.insert(4, at: 3)
print("\(d)") // c的内容不改变

// map
var squared:[Int] = []
for fib in fibs {
    squared.append(fib * fib)
}
print(squared)
let squares = fibs.map { fib in
    fib * fib
}
print(squares)

extension Array {
    func map<T>(_ transform:(Element) -> T) -> [T] {
        var result:[T] = []
        // 申请内存
        result.reserveCapacity(count)
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

let names = ["Paula", "Elena", "Zoe"]
var lastNameEndingInA: String?
for name in names.reversed() where name.hasPrefix("a") {
    lastNameEndingInA = name
    break
}
print(lastNameEndingInA ?? "none")

extension Sequence {
    func last(where predicate:(Element) -> Bool) -> Element? {
        for element in reversed() where predicate(element){
            return element
        }
        return nil
    }
}

let match = names.last { (element) -> Bool in
    return element.hasPrefix("a")
}
print(match ?? "none")

extension Array {
    func accumulate<Result>(_ initialResult:Result,_ nextPartialResult:(Result,Element)->Result) -> [Result] {
        var running = initialResult
        return map({ next in
            running = nextPartialResult(running,next)
            return running
        })
    }
}

let resultArr = [1,2,3,4].accumulate(0,+)
print(resultArr)

let nums = [1,2,3,4,5,6,7,8,9,10].filter{ $0 % 2 == 0}
print(nums)
let powerNum = (1..<10).map { $0 * $0}.filter { $0 % 2 == 0}
print(powerNum)

extension Array {
    func filter(_ isInclude:(Element) -> Bool) -> [Element] {
        var result:[Element] = []
        for x in self where isInclude(x) {
            result.append(x)
        }
        return result
    }
}

extension Sequence {
    public func all(matching predicate:(Element) -> Bool) -> Bool {
        return !contains(where: { !predicate($0)})
    }
}

let evenNums = nums.filter {$0 % 2 == 0}
print(evenNums)
print(evenNums.all(matching: { $0 % 2 == 0}))

// reduce
let fibs2 = [0,1,2,3,4,5]
var total = 0
for num in fibs2 {
    total = total + num
}
print(total)

let sum = fibs2.reduce(0) { total,num in
    total + num
}
print(sum)
let sum2 = fibs2.reduce("") { (str, num) in
    str + "\(num),"}
print(sum2)

extension Array {
    func reduce<Result>(_ initialResult:Result,_ nextPartialResult:(Result,Element) -> Result) -> Result {
        var result = initialResult
        for x in self {
            result = nextPartialResult(result,x)
        }
        return result
    }
}

extension Array {
    func map2<T>(_ transform:(Element)->T) -> [T] {
        return reduce([], {
            $0 + [transform($1)]
        })
    }
    
    func fitter2(_ isInclude:(Element) -> Bool) -> [Element] {
        return reduce([], {
            isInclude($1) ? $0 + [$1] : $0
        })
    }
    
    func filter3(_ isInclude:(Element)->Bool) -> [Element] {
        return reduce(into: [], { (result, element) in
            if isInclude(element) {
                result.append(element)
            }
        })
    }
    
}

// flatMap
extension Array {
    func flatMap<T>(_ transform:(Element)->[T]) -> [T] {
        var result:[T] = []
        for x in self {
            result.append(contentsOf: transform(x))
        }
        return result
    }
}
// flatmap 常见使用 合并两个数组元素
let suit = ["♠︎", "♥︎", "♣︎", "♦︎"]
let ranks = ["J","Q","K","A"]

let resultFlatMap = suit.flatMap { (suit) in
    ranks.map({ (rank)in
        (suit,ranks)
    })
}
//print(resultFlatMap)

// forEach
for element in [1,2,3] {
    print(element)
}

[1,2,3].forEach { (element) in
    print(element)
}

extension Array where Element:Equatable {
    func index(of element:Element) -> Int? {
        for idx in self.indices where self[idx] == element{
            return idx
        }
        return nil
    }
// bad ecample
//    func index_foreach(of element:Element) -> Int? {
//        self.indices.filter { (idx) in
//            self[idx] == element
//            }.forEach { idx in
//                return idx
//            }
//        return nil
//    }
}

// 切片
let slice = fibs[1...]
print(slice)

let newArray = Array(slice)
// 字典
enum Setting {
    case text(String)
    case int(Int)
    case bool(Bool)
}

let defaultSetting : [String:Setting] = [
    "Airplane Mode" : .bool(false),
    "Name" : .text("My iPhone")
]

print(defaultSetting["Name"]!)
var userSetting = defaultSetting
userSetting["Name"] = .text("Andy iPhone")
userSetting["Do it"] = .bool(true)
print(userSetting)
// 使用updateValue 更新字典
let oldName = userSetting.updateValue(.text("Apple"), forKey: "Name")
print(userSetting["Name"]!)
// 有用的字典方法
var setting = userSetting
let overriddenSetting:[String:Setting] = [
    "Name" : .text("Abert iPhone")
]
// 我们使用{$1}来作为合并两个值的策略，也就是说，如果莫日根键同时存在于
// overriddenSettingz中 我们使用overriddenSetting中的值
setting.merge(overriddenSetting) { $1}
print(setting)

extension Sequence where Element:Hashable {
    var frequencies:[Element:Int] {
        let frequencyPairs = self.map { ($0,1)}
        return Dictionary(frequencyPairs,uniquingKeysWith:+)
    }
}

let frequencies = "hello".frequencies
print(frequencies.filter({$0.value > 1}))

let settingAsString = setting.mapValues { (setting) -> String in
    switch setting {
    case .text(let text):return text
    case .int(let number): return String(number)
    case .bool(let value):return String(value)
    }
}
print(settingAsString)

// Hashable
// Set
let natureals:Set = [1,2,3,2]
print(natureals)
// 集合代数
let iPods:Set = [
    "iPod touch", "iPod nano",
    "iPod mini","iPod shuffle", "iPod Classic"
]
let discontinuedIPods:Set =  [
    "iPod mini", "iPod Classic",
    "iPod nano", "iPod shuffle"]
// 差集--补集
let currentPods = iPods.subtracting(discontinuedIPods)
print(currentPods)
// 交集
let touchscream:Set = [
    "iPhone", "iPad", "iPod touch", "iPod nano"
]
let iPodsWithTouch = iPods.intersection(touchscream)
print(iPodsWithTouch)

// 并集
var discontinued:Set = ["iBook","Powerbook","Power Mac"]
discontinued.formUnion(discontinuedIPods)
print(discontinued)
// 索引集合和字符集合
var indices = IndexSet()
indices.insert(integersIn: 1..<5)
indices.insert(integersIn: 11..<15)
let evenIndices = indices.filter { $0 % 2 == 0}
print(indices)
print(evenIndices)

extension Sequence where Element:Hashable {
    func unique() -> [Element] {
        var seem:Set<Element> = []
        return filter({ (element) in
            if seem.contains(element){
                return false
            }else {
                seem.insert(element)
                return true
            }
        })
    }
}

print([1,2,3,4,4,3,2,7,8].unique())

// Range
let singleDigtNumber = 0..<10
print(Array(singleDigtNumber))
let lowercaseLetters = Character("a")...Character("z")
print(lowercaseLetters.overlaps("c"..<"f"))
let fromZero = 0...

// 可数范围
for i in 0..<10 {
    print("\(i)",terminator:" ")
}

// 部分范围
let fromA:PartialRangeFrom<Character> = Character("a")...
let throughZ:PartialRangeThrough<Character> = ...Character("z")
let upto10:PartialRangeUpTo<Int> = ..<10
let frommFive:CountablePartialRangeFrom<Int> = 5...

// 范围表达式
//public protocol RangeExpression {
//    associatedtype Bound:Comparable
//    func contain(_ element:Bound) -> Bool
//    func relative<C:_Indexable>(to collection:C) -> Range<Bound> where C.index == Bound
//}
let arr = [1,2,3,4]
print(arr[2...])
print(arr[..<1])
print(arr[1...2])




