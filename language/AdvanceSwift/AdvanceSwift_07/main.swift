//
//  main.swift
//  AdvanceSwift_07
//
//  Created by yhp on 2018/10/9.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation
import CoreLocation

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
        var tmp:[Element] = []
        var i = lo,j = mi
        while i != mi && j != hi {
            if self[j] < self[i] {
                tmp.append(self[j])
                j += 1
            }else{
                tmp.append(self[i])
                i += 1
            }
        }
        
        // 看左右两边那边退出了，就将另一边的数据加到数组中
        tmp.append(contentsOf: self[i..<mi])
        tmp.append(contentsOf: self[j..<hi])
        
        //  交换数组
        replaceSubrange(lo..<hi, with: tmp)
    }
    
    /// 非递归版本
    mutating func mergeSortInPlaceInefficient(){
        let n = count
        var size = 1
        while size < n {
            for lo in stride(from: 0, to: n-size, by: size * 2){
                merge(lo: lo, mi: (lo + size), hi: Swift.min(lo + size * 2,n))
            }
            size *= 2
        }
    }
    // 闭包通过引用的方式来捕获变量
    mutating func mergeSortInPlace() {
        var tmp:[Element] = []
        // 并且确保它的大小g足够
        tmp.reserveCapacity(count)
        func merge(lo:Int,mi:Int,hi:Int){
            tmp.removeAll(keepingCapacity: true)
            var i = lo,j = mi
            while i != mi && j != hi {
                if self[j] < self[i] {
                    tmp.append(self[j])
                    j += 1
                }else{
                    tmp.append(self[i])
                    i += 1
                }
            }
            tmp.append(contentsOf: self[i..<mi])
            tmp.append(contentsOf: self[j..<hi])
            replaceSubrange(lo..<hi, with: tmp)
        }
        let n = count
        var size = 1
        while size < n {
            for lo in stride(from: 0, to: n-size, by: size * 2){
                merge(lo: lo, mi: (lo + size), hi: Swift.min(lo + size * 2,n))
            }
            size *= 2
        }
    }
}

// 函数作为代理,代理和协议的模式中不适合使用结构体
protocol AlertViewDelegate:AnyObject {
    func buttonTapped(atIndex:Int)
}

class AlertView {
    var buttons:[String]
    weak var delegate:AlertViewDelegate?
    // 使用存储回调函数的属性来替换原来的代理属性
    var buttonTapped:((_ buttonIndex:Int) -> ())?
    
    init(buttons:[String] = ["OK","Cancel"]) {
        self.buttons = buttons
    }
    func fine() {
        delegate?.buttonTapped(atIndex: 1)
    }
    func fine2() {
        buttonTapped?(1)
    }
}

//  inout 参数和可变方法
func increment(value:inout Int)  {
    value += 1
}

var i = 0
increment(value: &i)
print(i)
// 实际上,对于所有的下标，只要它同时拥有get 和 set 两个方法，这都是适用的

struct Point {
    var x :Int
    var y :Int
    
}

var point = Point(x: 0, y: 0)
increment(value: &point.x)
print(point)

// 如果一个属性是只读的，我们不能将其用于inout
// 运算符也可以接受inout值，但为了简化，在调用时
postfix func ++(x:inout Int){
    x += 1
}
point.x++
print(point)

// 嵌套函数和inout
func incrementTheTimes(value:inout Int) {
    func inc(){
        value += 1
    }
    for _ in 0..<10 {
        inc()
    }
}

var x = 0
incrementTheTimes(value: &x)
print(x)
// & 不意味inout的情况

func incref(pointer:UnsafeMutablePointer<Int>) -> ()->Int {
    return {
        pointer.pointee += 1
        return pointer.pointee
    }
}

let fun:()->Int
do {
    var array = [0]
    fun = incref(pointer: &array)
}
print(fun())

// 计算属性
struct GPSTrack {
    // 外部只读，内部读写
    private(set) var record:[(CLLocation,Date)] = []
}

extension GPSTrack {
//  创建一个计算属性
    var timestamps:[Date] {
        return record.map{ $0.1}
    }
}

// 观察变更
class Roboto {
    enum State {
        case stopped,movingForward,turningRight,turningLeft
    }
    var state = State.stopped
}

class ObservableRobot: Roboto {
    override var state: State{
        willSet{
            print("状态从\(state) 迁移到 \(newValue)")
        }
    }
}

var robot = ObservableRobot()
robot.state = .movingForward

// 延迟存储属性,该属性会被自动声明为var，
struct Point2 {
    var x : Double
    var y : Double
    private(set) lazy var distanceFromOrigin:Double = (x*x + y*y).squareRoot()
    init(x: Double,y:Double) {
        self.x = x
        self.y = y
    }
}

var point2 = Point2(x: 3, y: 4)
print(point2.distanceFromOrigin)
point2.x += 10
print(point2.distanceFromOrigin)

// 下标
let fibs = [0,1,1,2,3,5]
let first = fibs[0]
print(first)
print(fibs[1..<3])

extension Collection {
    subscript(indices indexList:Index...) -> [Element] {
        var result:[Element] = []
        for index in indexList {
            result.append(self[index])
        }
        return result
    }
}

print(Array("abcdefghijkmnopqrstuvwxyz")[indices:7,4,1,11,11,14])

// 下标进阶
var japan : [String:Any] = [
    "name": "Japan",
    "capital": "Tokyo",
    "population": 126_740_000,
    "coordinates": [
    "latitude": 35.0,
    "longitude": 139.0
    ]
]

extension Dictionary {
    subscript<Result>(key:Key,as type: Result.Type) -> Result?{
        get{
            return self[key] as? Result
        }
        set{
            guard let value = newValue as? Value else {
                return
            }
            self[key] = value
        }
    }
}

japan["coordinates",as:[String:Double].self]?["latitude"] = 36.0
print(japan["coordinates"]!)
