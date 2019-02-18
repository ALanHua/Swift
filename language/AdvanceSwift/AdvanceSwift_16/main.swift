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

