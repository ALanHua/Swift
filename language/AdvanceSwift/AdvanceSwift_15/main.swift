//
//  main.swift
//  AdvanceSwift_15
//
//  Created by yhp on 2019/1/12.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

// Tuple
var pair : (Int,String) = (1,"Two")
// 由于Swift可以类型推断,上面可以简写
let pair1 = (1,"Two")

let s = "hello"
for (ix,c) in s.enumerated() {
    print("character \(ix) is \(c)")
}
let ix = pair.0
print(ix)
print(pair.1)

let pair2: (first:Int,second:String) = (1,"Two")
// 这种比较简单
var pair3 = (first:1,second:"Two")
print(pair3.first)
pair3.first = 2
print(pair3.0)

for t in s.enumerated() {
    print("\(t.offset),\(t.element)")
}

let pair4 = (1,"Two")
let pairWithName:(first:Int,second:String) = pair4
print(pairWithName.first)

func tupleMake() -> (first:Int,second:String) {
    return (1,"Two")
}
print(tupleMake().first)

// Optional
var stringMaybe = Optional("howdy")
stringMaybe = "andy"
// The Swift language supports syntactic sugar for expressing an Optional type
var stringMaybe2: String? = "howdy"
// Unwrapping an Optional
if stringMaybe2 != nil {
    print("\(stringMaybe2!)")
}

// Optional chains
let upper = stringMaybe2?.uppercased()
if upper != nil {
    print(upper!)
}

// Optional map and flatMap
let s1:String? = "andy"
let s2 = s1.map {$0.uppercased()}
print(s2!)

// Comparison with Optional
// 编译器会自己判断，所以是阿全
let s3: String? = "Howdy"
if s3 == "Howdy" {
    print("Comparison")
}

// initializer object type
class Dog {
    var name: String
    var license : Int
    // 带默认参数的构造器
    init(name:String = "",license:Int = 0) {
        self.name    = name
        self.license = license
    }
}

let find  = Dog(name: "Fido")
let rover = Dog(license: 1234)
let spot  = Dog(name: "Spot", license: 1357)
let puff = Dog()

// Delegating initializers
/**
 注意：
 delegating initializer cannot set a constant property
 
 */
struct Digit {
    var number : Int
    var meaningOfLife: Bool
    
    init(number:Int) {
        self.number = number
        self.meaningOfLife = false
    }
    
    init() {// 委托初始化器
        self.init(number: 42)
        self.meaningOfLife = true
    }
}

// Failable initializers
class Dog2 {
    var name: String
    var license : Int
    
    init?(name:String,license:Int) {
        if name.isEmpty {
            return nil
        }
        if license == 0 {
            return nil
        }
        self.name    = name
        self.license = license
    }
}

// A static/class property,
// means that it is global and unique
struct Greeting {
    static let friendly = "hello there"
    static let hostile = "go away"
    // static 修饰的出事是lazy
    static let ambivalent = friendly + " but " + hostile
    static let ambivalent2 = Greeting.friendly + " but " + Greeting.hostile
    // computed property, I can use self
    // self means the type itself
    static var ambivalent3: String {
        return self.friendly + " but " + self.hostile
    }
}

print(Greeting.friendly)
print(Greeting.ambivalent)
// Property initialization
class Moi {
    let first = "Matt"
    let last = "Neuburg"
    /*
     计算属性,计算属性可以使用self
     因为它不会被执行知道self真实存在
     */
    var whole : String {
        return self.first + " " + self.last
    }
    // Like a computed property
    lazy var whole1 = self.first + " " + self.last
    
    /*
     lazy修饰的属性可以使用匿名函数初始化
     匿名函数内部可以使用self
    */
    lazy var whole2: String = {
        var s = self.first
        s.append(" ")
        s.append(self.last)
        return s
    }()
}

// Methods
class Dog3 {
    var name: String
    var license : Int
    let whatDogSay = "woof"
    // 带默认参数的构造器
    init(name:String = "",license:Int = 0) {
        self.name    = name
        self.license = license
    }
    func bark() {
        print(self.whatDogSay)
    }
    
    // instance code can use self to refer to this instance
    func speek() {
        self.bark()
        print("I'm \(self.name)")
    }
}

// Subscripts
// Here’s a secret: instance methods are actually static/class methods
/**
 实例方法实际上是一个curry过的静态/类方法，
 由两个函数组成——一个函数接受实例，
 另一个函数接受实例方法的参数
 */
class MyClass {
    var s = ""
    func store(_ s : String) {
        self.s = s
    }
}
let m = MyClass()
let f = MyClass.store(m)
f("howdy")
print(m.s)

struct Digit2 {
    var number: Int
    init(_ n: Int) {
        self.number = n
    }
    // 这里没有处理异常情况
    subscript(ix:Int) -> Int {
        get {
            let s = String(self.number)
            return Int(String(s[s.index(s.startIndex, offsetBy: ix)]))!
        }
        set {
            var s = String(self.number)
            let i = s.index(s.startIndex, offsetBy:ix)
            s.replaceSubrange(i...i, with: String(newValue))
            self.number = Int(s)!
        }
    }
}

var d = Digit2(1234)
print(d[1])
d[1] = 5
print(d[1])

