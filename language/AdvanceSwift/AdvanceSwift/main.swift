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













