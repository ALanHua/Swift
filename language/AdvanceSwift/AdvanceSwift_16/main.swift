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
 AnyObject:任何类
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
