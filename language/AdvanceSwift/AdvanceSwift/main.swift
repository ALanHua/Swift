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




