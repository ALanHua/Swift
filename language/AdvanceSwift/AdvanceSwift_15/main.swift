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

// Nested Object Types
class Dog4 {
    struct Nosie {
        static var nosie = "woof"
    }
    func bark() {
        print(Dog4.Nosie.nosie)
    }
}

// Instance References
// Enums

enum Filter {
    case albums
    case playlists
    case podcasts
    case books
}
func filterExpecter(_ type: Filter) {
    if type == .albums {
        print("it's albums")
    }
}
let type: Filter = .albums
filterExpecter(.albums)

// Raw Values
enum PepBoy: Int {
    case manny
    case moe
    case jack
}

// 编译器会自动转换成字符串
enum Filter2: String {
    case albums
    case playlists
    case podcasts
    case books
}

let albums: Filter2 = .albums
print(albums.rawValue)

enum Normal: Double {
    case fahrenheit = 98.6
    case centigrade = 37
}

enum PepBoy2 : Int {
    case manny = 1
    case moe
    case jack = 4
}
// 这样会有一个问题，当没有这个case的时候，初始化会失败
let type2 = Filter2(rawValue: "Albums")

// Associated Values
enum MyError : Equatable{
    case number(Int)
    case message(String)
    case fatal
}

let err: MyError = .number(4)
let num = 4
let err2 : MyError = .number(num)

if err == MyError.number(num) {
    print(num)
}

// Enum Case Iteration
enum Filter3 : String ,CaseIterable{
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
//    4.2 之后就不需要手动写这部分代码啦，继承CaseIterable就可以啦
//    static let cases: [Filter2] = [.albums,.playlists,.podcasts,.books]
}

// Enum Initializers
enum Filter4 : String ,CaseIterable{
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    
    init(_ ix : Int){
        // allCases 是一个序列组合
        self = Filter4.allCases[ix]
    }
}

let type_1 = Filter4.albums
let type_2 = Filter4(rawValue: "Playlists")
let type_3 = Filter4(2)
print(type_3.rawValue)

enum Filter5 : String ,CaseIterable{
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    
    init?(_ ix : Int){
        // allCases 是一个序列组合
        if !Filter5.allCases.indices.contains(ix) {
            return nil
        }
        self = Filter5.allCases[ix]
    }
}

enum Filter6 : String ,CaseIterable{
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"
    
    init?(_ ix : Int){
        // allCases 是一个序列组合
        if !Filter6.allCases.indices.contains(ix) {
            return nil
        }
        self = Filter6.allCases[ix]
    }
    init?(_ rawValue: String){
        self.init(rawValue: rawValue)
    }
}

let type6 = Filter6.albums
let type7 = Filter6(rawValue: "Playlists")
let type8 = Filter6(2)
print(type6.rawValue)
print(type7!.rawValue)
print(type8!.rawValue)

// Enum Properties
/**
 注意点：
 可以有实例属性和静态属性，计算属性，但不能由存储属性
 */
// Enum Methods
enum Shape{
    case rectangle
    case ellipse
    case diamond
    func addShape(to p : CGMutablePath,in r : CGRect) -> () {
        switch self {
        case .rectangle:
            p.addRect(r)
        case .ellipse:
            p.addEllipse(in: r)
        case .diamond:
            p.move(to: CGPoint(x: r.minX, y: r.minY))
            p.addLine(to: CGPoint(x: r.midX, y: r.minY))
            p.addLine(to: CGPoint(x: r.maxX, y: r.midY))
            p.addLine(to: CGPoint(x: r.midX, y: r.maxY))
            p.closeSubpath()
        }
    }
}

/*
 An enum instance method that modifies the enum itself
 must be marked as mutating
*/
enum Filter7 : String ,CaseIterable{
    case albums = "Albums"
    case playlists = "Playlists"
    case podcasts = "Podcasts"
    case books = "Audiobooks"

    mutating func advance(){
        var ix = Filter7.allCases.firstIndex(of: self)!
        ix = (ix + 1) % Filter7.allCases.count
        self = Filter7.allCases[ix]
    }
}

var type10 = Filter7.books
type10.advance()
print(type10.rawValue)

enum InterfaceMode: Int {
    case timed = 0
    case practice = 1
}

// Structs
struct Digit3 {
    var number = 42
    init(number: Int) {
        self.number = number
    }
}
// Struct As Namespace
struct Default {
    static let rows = "CardMatrixRows"
    static let columns = "CardMatrixColumns"
    static let hazyStripy = "HazyStripy"
}
print(Default.columns)

// struct Mutating Captured Self is illegal
struct Digit4 {
    var number: Int
    init(number: Int) {
        self.number = number
    }
    
    mutating func changeNumberTo(_ n : Int){
        self.number = n
    }
    
    mutating func callAnotherFunction() {
        otherFunction{
//            self.changeNumberTo(345)
        }
    }
    func otherFunction(_ f: @escaping ()->()) {
    
    }
}

/*
 value type:     struct
 reference type: class
 */

// Inheritance  Overriding
class Quadruped {
    func walk () {
        print("walk walk walk")
    }
}

class Dog5: Quadruped{
    func bark () {
        print("woof")
    }
}

class NoisyDog: Dog5 {
    // 函数重载
    override func bark() {
        print("woof woof woof")
    }
}

// Class Initializers
/**
 够着起分类
 1,Designated initializer   默认构造器
 2,Convenience initializer  便利构造器
     增加init的初始化方法
     必须调用Swift同一个类中的designated初始化完成设置
     convenience的初始化方法不能被子类重写或者是从子类中以super的方式被调用
 3,Implicit initializer     隐式构造器
 */

class Dog6 {
    var name : String
    var license : Int
    init(name:String, license:Int) {
        self.name = name
        self.license = license
    }
    convenience init(license: Int) {
        self.init(name: "Fido", license: license)
    }
//    convenience init(){
//        self.init(license: 1)
//    }
}

class NoisyDog2 : Dog6 {
}
/**
下面这段代码是非法的，因为它的父类没有init()构造器
 */
//let md3 = NoisyDog2()

// Required initializers 子类必须重载它
class Dog7 {
    var name : String
    required init(name:String) {
        self.name = name
    }
}

class NoisyDog3: Dog7 {
    var obedient = false
    init(obedient: Bool) {
        self.obedient = obedient
        super.init(name: "andy")
    }
    
    required init(name: String) {
        super.init(name: name)
    }
}

// Class Properties and Methods


