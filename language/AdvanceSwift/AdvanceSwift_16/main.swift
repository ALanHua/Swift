//
//  main.swift
//  AdvanceSwift_16
//
//  Created by yhp on 2019/2/7.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

// Protocols
protocol Flier {
    func fly()
}

struct Bird: Flier {
    func fly() {
        print("Bird fly()")
    }
    func getWorm() {
        print("Get Worm")
    }
}

func tellToFly(_ f: Flier) {
    f.fly()
}

struct Bee:Flier {
    func fly() {
        print("Bee fly()")
    }
}

tellToFly(Bee())

//
enum Filter: String,CustomStringConvertible {
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    var description : String {
        return self.rawValue
    }
}

let type = Filter.albums
print("\(type)")

// Protocol Type Testing and Casting
func isBird(_ f: Flier) -> Bool {
    return f is Bird
}

func tellGetWorm(_ f : Flier)  {
    (f as? Bird)?.getWorm()
}
// object-c 桥接到swift
@objc protocol Flier2{
    @objc optional var song: String{get}
    @objc optional func sing()
}

class Bird2: Flier2 {
    func sing() {
        print("Bird2 Flier2")
    }
}

let f: Flier2 = Bird2()

// Class Protocol 只能被类继承
protocol SecondViewControllerDelegate: class {
    func accept(data: Any!)
}

// Implicitly Required Initializers
protocol Flier3 {
    init()
}
// 继承包含初始化方法的协议，继承者必须在初始化方法前面添加required关键字
class Bird3: Flier3 {
    required init() {
        print("Bird3 init")
    }
}

// Literal Convertibles 字面量协议
struct Nest: ExpressibleByIntegerLiteral {
    var eggCount: Int = 0
    
    init() {}
    init(integerLiteral value: Int) {
        self.eggCount = value
    }
}

func reportEggs(_ next: Nest) {
    print("nest containss \(next.eggCount)")
}
reportEggs(4)
reportEggs(13)

class Dog{
    var name : String
    required init(name: String){
        self.name = name
    }
    // 工厂方法
    class func makeAndName() -> Dog {
        let d = self.init(name: "Fldo")
        return d
    }
    //    解决不能返回子类类型，Self只是指代，必须要求一个required init的初始化方法
    func havePuppy(name: String) -> Self {
        return Swift.type(of: self).init(name: name)
    }
}
/**
 Dog.Type 是取Dog的元类型
 Dog.self 是取Dog的元类型的值
 */
func dogMakerAndNamer(_ whattype: Dog.Type) -> Dog {
    let d = whattype.init(name: "Fido")
    return d
}
class NoisyDog : Dog {
    
}
let dog = dogMakerAndNamer(NoisyDog.self)
print(dog.name)

let s: Optional<String> = "andy"
print(s!)

// Generic Declarations
protocol Flier4 {
    func flockTogetherWith(_ f: Self)
}

protocol Flier5 {
    associatedtype Other
    func flockTogetherWith(_ f: Other)
    func mateWith(_ f: Other)
}

struct Bird5: Flier5{
    func flockTogetherWith(_ f: Bird5) {}
    func mateWith(_ f: Bird5) {}
}

// Generic functions 泛型
func takeAndReturnSameThing<T>(_ t: T) -> T {
    return t
}
let thing = takeAndReturnSameThing("apple")
print(thing)
// Generic object types
struct HolderOfTwoSameThings<T> {
    var firstThing : T
    var secondThing : T
    
    init(thingOne:T, thingTwo:T) {
        self.firstThing  = thingOne
        self.secondThing = thingTwo
    }
}

let holder = HolderOfTwoSameThings(thingOne: "a", thingTwo: "b")
// Contradictory Resolution
func dogMakerAndNamer<WhatType: Dog>(_ : WhatType.Type) -> WhatType{
    let d = WhatType.init(name: "dog")
    return d
}
// Type Constraints
protocol Flocker {
    func flockTogetherWith(f:Flier)
}

struct Bird6:Flier, Flocker{
    func fly() {}
    func flockTogetherWith(f: Flier) {}
}

func myMin<T:Comparable>(_ things:T...) -> T?{
    guard let first = things.first else{
        return nil
    }
    
    var mininum = first
    for item in  things.dropFirst(){
        if item < mininum{
            mininum = item
        }
    }
    return mininum
}

// Explicit Specialization
protocol Flier7 {
    associatedtype Other
}
struct Bird7: Flier7{
    typealias Other = String
}

// Generic object type
protocol Flier8 {
    init()
}
struct Bird8: Flier8{
    init(){}
}

struct FlierMaker<T:Flier8> {
    static func makeFlier() -> T{
        return T()
    }
}

let f8 = FlierMaker<Bird8>.makeFlier()

// Generic Invariance
/**
 a generic type specialized to a subtype is not polymorphic with respect to the same generic type specialized to a supertype
 专用于子类型的泛型类型对于专用于超类型的相同泛型类型不是多态的
 */
protocol Meower {
    func meow()
}

struct Wrapper<T:Meower> {
    let meower : T
}
 class Cat : Meower {
    func meow() {
        print("meow")
    }
}
class CalicoCat : Cat {
}

let w: Wrapper<Cat> = Wrapper(meower: CalicoCat())

// Associated Type Chains
protocol Fighter {
    associatedtype Enemy : Fighter
}
struct Soldier : Fighter {
    typealias Enemy = Archer
}
struct Archer : Fighter {
    typealias Enemy = Soldier
}

protocol Wieldable {
}
struct Sword : Wieldable {
}
struct Bow : Wieldable {
}

protocol Fighter2 {
    associatedtype Enemy : Fighter2
    associatedtype Weapon : Wieldable
    func steal(weapon:Self.Enemy.Weapon,form:Self.Enemy)
}
struct Soldier2 : Fighter2 {
    typealias Weapon = Sword
    typealias Enemy = Archer2
    func steal(weapon:Bow,form:Archer2){
    }
}
struct Archer2 : Fighter2 {
    typealias Weapon = Bow
    typealias Enemy = Soldier2
    func steal(weapon:Sword,form:Soldier2){
    }
}
// Where Clauses
protocol Flier9 {
    associatedtype Other
}
struct Bird9: Flier9 {
    typealias Other = String
}

struct Insect3 : Flier9 {
    typealias Other = Bird9
}
func flockTogether<T>(_ f: T)where T:Flier9,T.Other:Equatable{
    
}

// Extensions
/**
 原则:
 1,可以重写一个存在的成员，但不能重载一个存在的方法
 2,不能定义存储属性，只能定义计算属性
 3,类不能定义指定构造器和析构，但可以定义方便构造器
 */
extension CGRect{
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}

extension String {
    func range(_ start:Int,_ count: Int) -> Range<String.Index> {
        let i = self.index(start >= 0 ?
            self.startIndex:
            self.endIndex, offsetBy: start)
        //  这里需要注意count是否越界
        let j = self.index(i, offsetBy: count)
        return i..<j
    }
}

// Extending Protocols
// Extending Generics
class Dog2<T> {
    var name: T?
}
extension Dog2 {
    func sayYourName() -> T?{
        return self.name
    }
}

extension Array where Element:Comparable{
    func myMin() -> Element? {
        var minnum = self.first
        for item in self.dropFirst() {
            if item < minnum! {
                minnum = item
            }
        }
        return minnum
    }
}

// Starting in Swift 4.1 我们可以直接比较两个数组
let arr1 = [1,2,3]
let arr2 = [1,2,3]
if arr1 == arr2 {
    print("arr1 = arr2 ")
}

// Umbrella Types
/**
 Any:任何类型
 AnyObject:任何类 all class type
 AnyClass: is the type of AnyObject
 
 === 和 !== 去判断 检测指针地址是否相等
 */
func anyExpecter(_ a:Any) {}
anyExpecter("howdy")            // a struct instance
anyExpecter(String.self)        // a struct type
anyExpecter(Dog(name: "andy"))  // a class instance
anyExpecter(Dog.self)           // a class type
anyExpecter(anyExpecter)        // a function
let ud = UserDefaults.standard
ud.set(Date(), forKey: "now")
let d = ud.object(forKey: "now")
if d is Date {
    print(d!)
}

let d4 = Dog(name: "andy")
let anys : AnyObject = d4
let d5 = anys as! Dog

class Dog5 {
    @objc var noise: String = "woof"
    @objc func bark() -> String {
        return "woof"
    }
    @objc static var whatADogSays : String = "woof"
}
class Cat5 {}

let c5: AnyObject = Cat5()
/* Dog属性噪声和Dog方法bark被标记为@objc，
   因此它们作为发送给AnyObject的潜在消息是可见的。
 */
let s5 = c5.noise

// class var layerClss: AnyClass {get}
let c6: AnyClass = Cat5.self
let s6 = c6.whatADogSays

// Collection Types
/**
 Array: a struct
    Array(1...3) generates the array of Int [1,2,3].
    Array("hey") generates the array of Character ["h","e","y"].
    Array(d), where d is a Dictionary, generates an array of tuples of the key–value pairs of d.
     ArraySlice: is not a new array; it’s just a way of pointing into a section of the original array
 */
// 创建一个空数组
var arr = [Int]()
var arr_: [Int] = []

let arr_1: [Any] = [1,"andy"]

let strings:[String?] = Array(repeating: nil, count: 100)
// 以下需要注意,创建的是3个Dog的引用数组
let dogs = Array(repeating:Dog(name: "andy"), count:3)
// Array comparison
let i1 = 1
let i2 = 2
let i3 = 3
let arr_i : [Int] = [1,2,3]
if arr_i == [i1,i2,i3] {
    print("they are equal")
}
// ArraySlice
let arr_2 = ["manny", "moe", "jack"]
let slice = arr_2[1...2]
print(slice)
let arr_3 = Array(slice)
print(arr_3[1])

var arr_4 = [1,2,3]
arr_4[1] = 4
print(arr_4)
arr_4[1..<2] = [7,8]
print(arr_4)
print(arr_4[1...])
print(arr_4[...2])

// Nested arrays 2纬数组
let arr_5 = [[1,2,3], [4,5,6], [7,8,9]]
let i_j = arr_5[1][1]
print(i_j)

// Basic array properties and methods
var arr_6 = [1,2,3,4,5,6,7,8]
// 后几个元素
let slice_6 = arr_6.suffix(2)
print(slice_6)
print(arr_6.suffix(15))
let slice_7 = arr_6.suffix(from: 5)
print(slice_7)
let slice_8 = arr_6.prefix(upTo: 4)
print(slice_8)

let ok = arr_6.contains(7)
print(ok)

let ok_2 = arr_6.starts(with: [1,2])
print(ok_2)
let ok_3 = arr_6.starts(with: [1,-2]) { abs($0) == abs($1)}
print(ok_3)

// 最大，最小
print(arr_6.min()!)
print(arr_6.max()!)
// 向数组中添加元素
arr_6.append(4)
print(arr_6)
arr_6.append(contentsOf: [5,6])
print(arr_6)
// append == + operator
let arr_7 = arr_6 + [4]
print(arr_7)

// insert remove dropFirst ...
let arr_8 = [[1,2], [3,4], [5,6]]
let joined = Array(arr_8.joined(separator: [10,11]))
print(joined)
//joined() 表示不需要分割
let joined_2 = Array(arr_8.joined())
print(joined_2)

// split
let arr_9 = [1,2,3,4,5,6]
let arr_10 = arr_9.split { $0 % 2 == 0}
print(arr_10)// [[1],[3],[5]]

// sort
var arr_11 = [10,9,7,2,30,5]
arr_11.sort()
print(arr_11)
//print(arr_11.sort(by: { $0 > $1 }))

// swapAt
arr_11.swapAt(0, 2)
print(arr_11)

// Array enumeration and transformation
var pepboys = ["Manny", "Moe", "Jack"]
for pepboy in pepboys {
    print(pepboy)
}

pepboys.forEach {print($0)}

// 如果你需要数组的下标可以如下使用 for in
for (ix,pepboy) in pepboys.enumerated() {
    print("\(ix) is \(pepboy)")
}
pepboys.enumerated().forEach {
    print("Pep boy\($0.offset) is \($0.element)")
}

// allSatisfy
let ok2 = pepboys.allSatisfy {$0.hasPrefix("M")}
print(ok2)

// filter
let pepboys2 = pepboys.filter {$0.hasPrefix("M")}
print(pepboys2)

// removeAll
pepboys.removeAll {$0.hasPrefix("M")}
print(pepboys)

// map
let arr_12 = [1,2,3]
let arr_13 = arr_12.map { Double($0)}
print(arr_13)

// flatMap 可以降维
let arr_14 = [[1, 2], [3, 4]]
let arr_15 = arr_14.flatMap { $0.map{String($0)}}
print(arr_15)

// compactMap safely unwraps them by first eliminating any nil ele‐ ments
// 过滤 nil 元素
let arr_16 = ["1", "hey", "2", "ho"]
let arr_17 = arr_16.compactMap { Int($0)}
print(arr_17)

// reduce
let arr_18 = [1, 4, 9, 13, 112]
let sum = arr_18.reduce(0) { $0 + $1}
let sum2 = arr_18.reduce(0,+)
print(sum)
