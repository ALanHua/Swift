//
//  main.swift
//  AdvanceSwift_07
//
//  Created by yhp on 2018/10/9.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

func printInt(i:Int) {
    print("you passed \(i)")
}

let funVar = printInt
funVar(2)

// 接受函数作为参数的函数
func useFunction(function:(Int)->()) {
    function(3)
}
useFunction(function: printInt)
useFunction(function: funVar)

// 函数作为返回值
func returnFunc() -> (Int)->(String) {
    func innerFunc(i:Int) -> String {
        return "ypou win \(i)"
    }
    return innerFunc
}

let myFunc = returnFunc()
print(myFunc(4))

// 函数可以捕获存在于他们作用范围之外的变量
func counterFunc() -> (Int) -> String {
    var counter = 0
    func innerFunc(i:Int) -> String {
        counter += i //  counter 被捕获了
        return "running : \(counter)"
    }
    return innerFunc
}

let f = counterFunc()
print(f(3))
print(f(4))

let g = counterFunc()
print(g(2))
print(g(2))
print(f(2))

//  函数可以使用{} 来声明闭包表达式

func doubler(i:Int) -> Int {
    return i * 2
}
print([1,2,3,4].map(doubler))

let doublerAlt = {
    (i:Int) -> Int in
    return i * 2
}
print([1,2,3,4].map(doublerAlt))

/**
 闭包的特性
 0，如果你将闭包作为参数传递，并且你不再用这个闭包做其他事情
    的话，就没必要将个存储到一个剧本变量中
 1，如果编译器可以上下文推断出类型的话，你不需要指明它
 2，如果闭包表达式的主体部分只包括一个单一的表达式的话
    它将自动h返回这个表达式的结果，你可以不写return
 3, Swift 会自动为函数的参数提供简写形式，$0 代表第一个参数，$1 代表第二个参数，以此类推。”
 4, 如果函数的最后一个参数是闭包表达式的话，你可以将这个闭包表达式移到函数调用的圆括号的外部。这样的尾随闭包语法在多行的闭包表达式中表现非常好，因为它看起来更接近于装配了一个普通的函数定义，或者是像 if (expr) { } 这样的执行块的表达形式
 5, 最后，如果一个函数除了闭包表达式外没有别的参数，那么方法名后面的调用时的圆括号也可以一并省略”
 */
print([1,2,3].map({ (i:Int) -> Int in
    return i * 2
}))
print([1,2,3].map({ i in
    return i * 2
}))
print([1,2,3].map({ i in
     i * 2
}))
print([1,2,3].map({ $0 * 2}))
print([1,2,3].map(){ $0 * 2})
print([1,2,3].map{$0 * 2})

print((0..<3).map{ _ in
    arc4random()
})

// 显示指定变量类型时，你不一定要在闭包表达式内部指定
let isEven = {$0 % 2 == 0}
let isEvenAlt = {
    (i:Int8) -> Bool in
    i % 2 == 0
}
// 也可以在闭包的上下文里提供这些信息
let isEvenAlt2:(Int8) -> Bool = {
    $0 % 2 == 0
}

let isEvenAlt3 = {$0 % 2 == 0} as (Int8) -> Bool

// 定义一个队所有整数类型都适用的isEven
extension BinaryInteger {
    var isEven: Bool {
        return self % 2 == 0
    }
}
// 声明一个函数
func isEven<T:BinaryInteger>(_ i : T) -> Bool {
    return i % 2 == 0
}

/*** 函数的灵活性 */
let myArray = [3,2,1]
print(myArray.sorted())
// 降序
print(myArray.sorted(by: >))
var numberStrings = [(2,"two"),(1,"one"),(3,"three")]
print(numberStrings.sorted(by: <))
// 复杂的排序
let animals = ["elephant", "zebra", "dog"]
let animalsSorted = animals.sorted { (lhs, rhs) -> Bool in
    let l = lhs.reversed()
    let r = rhs.reversed()
    return l.lexicographicallyPrecedes(r)
}
print(animalsSorted)


//@objcMember 标记的类将在Object-C中可见
@objcMembers
final class Person:NSObject {
    let first:String
    let last:String
    let yearOfBirth:Int
    
    init(first:String,last:String,yearOfBirth:Int) {
        self.first = first
        self.last  = last
        self.yearOfBirth = yearOfBirth
    }
    
}

let people = [
    Person(first: "Emily", last: "Young", yearOfBirth: 2002),
    Person(first: "David", last: "Gray", yearOfBirth: 1991),
    Person(first: "Robert", last: "Barnes", yearOfBirth: 1985),
    Person(first: "Ava", last: "Barnes", yearOfBirth: 2000),
    Person(first: "Joanne", last: "Miller", yearOfBirth: 1994),
    Person(first: "Ava", last: "Barnes", yearOfBirth: 1998),
]

let lastDescriptor = NSSortDescriptor(key: #keyPath(Person.last), ascending: true, selector: #selector(NSString.localizedCompare(_:)))
let firstDescriptor = NSSortDescriptor(key: #keyPath(Person.first),
                                          ascending: true,
                                          selector: #selector(NSString.localizedStandardCompare(_:)))
let yearDescriptor = NSSortDescriptor(key: #keyPath(Person.yearOfBirth),
    ascending: true)
let descriptors = [lastDescriptor, firstDescriptor, yearDescriptor]
(people as NSArray).sortedArray(using: descriptors)
print(people)

// swift 实现
var strings = ["Hello", "hallo", "Hallo", "hello"]
strings.sort {$0.localizedStandardCompare($1) == .orderedAscending}
print(strings)

// 函数作为数据
typealias SortDescriptor<Value> = (Value,Value) -> Bool

// 好复杂的一个函数
func sortDescriptor<Value,Key>(key:@escaping (Value) -> Key,
                               ascending:Bool = true,
                               by compartor:@escaping (Key) -> (Key)
        -> ComparisonResult) -> SortDescriptor<Value>{
            return {
                (lhs,rhs) in
                let order:ComparisonResult = ascending ? .orderedAscending : .orderedDescending
                return compartor(key(lhs))(key(rhs)) == order
            }
}

let sortByFirstName:SortDescriptor<Person> = sortDescriptor(key: { $0.first
}, by: String.localizedStandardCompare)

print(people.sorted(by: sortByFirstName))


// 可以写一个自定义的运算符，来合并两个排序函数
/**
 和逻辑 || && 一个优先组
 */
infix operator <||>: LogicalDisjunctionPrecedence
func <||><A>(lhs:@escaping (A,A) -> Bool,rhs:@escaping (A,A) -> Bool) -> (A,A) ->Bool {
    return {(x,y) in
        if lhs(x,y) {
            return true
        }
        if lhs(y,x) {
            return false
        }
        if rhs(x,y) {
            return true
        }
        return false
    }
}

// 局部函数和变量捕获
extension Array where Element:Comparable {
    private mutating func merge(lo:Int,mi:Int,hi:Int) {
        //  MARK:明天实现
    }
}



