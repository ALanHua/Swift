//
//  main.swift
//  AdvanceSwift_03
//
//  Created by yhp on 2018/9/13.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

//// 可选值 原型
//enum Optional<Wrapped> {
//    case none
//    case some(Wrapped)
//}

extension Collection where Element:Equatable {
    func index(of element:Element) -> Optional<Index> {
        var idx = startIndex
        while idx != startIndex {
            if self[idx] == element {
                return .some(idx)
            }
            formIndex(after: &idx)
        }
        return .none
    }
}

var array = ["one","two","three"]
switch array.index(of: "four") {
    case .some(let idx):
        array.remove(at: idx)
    case .none:
        break
}
// if let
if let idx = array.index(of: "four"),idx != array.startIndex{
     array.remove(at: idx)
}

//let urlString = "https://www.objc.io/logo.png"
//if let url = URL(string: urlString),
//    let data = try? Data(contentsOf: url),
//    let image = UIImage(data: data)
//
//{
//    let view = UIImageView(image: image)
//    PlaygroundPage.current.liveView = view
//}
// case let
let scanner = Scanner(string: "lisa123")
var username:NSString?
let alpha = CharacterSet.alphanumerics
if scanner.scanCharacters(from: alpha, into: &username),
    let name = username {
    print(name)
}
// while let
while let line = readLine(),!line.isEmpty{
     print(line)
}
let array2 = [11,12,13]
var iterator = array2.makeIterator()
while let i = iterator.next() {
    print(i)
}

for i in 0..<10 where i % 2 == 0 {
    print(i,terminator:" ")
}

// 用while重写上面的例子
var iterator1 = [0..<10].makeIterator()
while let i = iterator.next() {
    if i % 2 == 0{
        print(i)
    }
}

var function:[()->Int] = []
for i in 1...3 {
    function.append {i}
}

for f in function {
    print("\(f())")
}

// 双重可选值
let stringNumber = ["1","2","three"]
let maybeInts = stringNumber.map { Int($0)}
var iterator3 = maybeInts.makeIterator()
while let maybeInt = iterator3.next() {
    print(maybeInt)
}

/**
 x? 其实是.Some(x)的简写
 */
for case let i? in maybeInts {
    print(i)
}

let j = 5
if case 0..<10 = j {
    print("\(j)，在匹配范围内")
}
// case 匹配可以重载
struct Pattern {
    let s: String
    init(_ s:String) {
        self.s = s
    }
}

func ~=(pattern:Pattern,value:String) -> Bool {
    return value.range(of: pattern.s) != nil
}

let s = "Taylor Swift"
if case Pattern("Swift") = s{
    print("\(String(reflecting: s))")
}

// if var / while var
let number = "1"
if var i = Int(number) {
    i += 1
    print(i)
}

// guard
func doStuff(withArray a :[Int]) {
    guard let firstElement = a.first else {
        return
    }
    print(firstElement)
}

extension String {
    var fileExtension:String?{
        guard let period = index(of: ".") else {
            return nil
        }
        let extensionStart = index(after: period)
        return String(self[extensionStart...])
    }
}

// 一个函数返回值如果是Never的话，就意味着告诉编译器这个函数不会返回
// 有两个常见的函数会这么做，一个是fatalError / dispatchMain
// Never 又被叫做无人类型
// Void 是空元组的一个写法

// 可选链
let str: String? = "Never say never"
let upper:String
if str != nil {
    upper = str!.uppercased()
    print(upper)
}else{
    fatalError("error")
}
let lower = str?.uppercased().lowercased()
//print(lower)
extension Int {
    var half:Int?{
        guard self < -1 || self > 1 else {
            return nil
        }
        return self / 2
    }
}
//print(20.half?.half?.half)
let dictOfArrays = ["nine":[0,1,2,3]]
//dictOfArrays["nime"]?[3]
//print(dictOfArrays["nine"]?[3])
let dictOfFunction:[String:(Int,Int)->Int] = [
    "add":(+),
    "subtract":(-)
]
//dictOfFunction["add"]?(1,3)
//print(dictOfFunction["add"]?(1,3))

class TextField {
    private(set) var text = ""
    var didChange:((String)->())?
    
    private func textDidChange(newText:String){
        text = newText
        didChange?(text)
    }
    
}

struct Person {
    var name:String
    var age:Int
}

var optionalLise:Person? = Person(name: "andy", age: 8)
// 如下这样写不可行
//if var lisa = optionalLise{
//    lisa?.age += 1
//}
optionalLise?.age += 1
//print(optionalLise?.age)

// MARK: 有一个比较古怪的的边界情况
var a:Int? = 5
a? = 10
//print(a)
var b:Int? = nil
b? = 10
//print(b)
// nil 合并运算符
let stringteger = "1"
let number2 = Int(stringteger) ?? 0
print(number2)

extension Array {
    subscript(guarded idx: Int) ->Element?{
        guard (startIndex ..< endIndex).contains(idx) else{
            return nil
        }
        return self[idx]
    }
}

let array3 = [1,2,4]
print(array3[guarded:5] ?? 0)

let i1:Int? = nil
let j1:Int? = nil
let k1:Int? = 42
let t = i1 ?? j1 ?? k1 ?? 0
print(t)

let m = i1 ?? j1 ?? k1
print(type(of:m))

if let n = i1 ?? j1 {
   print(n)
}

// 字符串差值中使用可选值
let bodyTemperature:Double? = 37.0
let bloodGlucose:Double? = nil

infix operator ???:NilCoalescingPrecedence
public func ???<T>(optional:T?,defaultValue:@autoclosure ()->String) -> String{
    switch optional {
    case let value?:
        return String(describing: value)
    case nil:
        return defaultValue()
    }
}
print("\(bodyTemperature ??? "n/a")")
print("\(bloodGlucose ??? "n/a")")

// 可选值map
extension Optional{
    func map<U>(transform:(Wrapped)-> U) -> U? {
        if let value = self {
            return transform(value)
        }
        return nil
    }
}

let characters:[Character] = ["a","b","c"]
print(String(characters[0]))

let firstChar = characters.first.map { $0}
print(firstChar!)


extension Array {
    func reduce(_ nextPartialResult:(Element,Element) -> Element) -> Element? {
//        guard let fst = first else{
//            return nil
//        }
//        return dropFirst().reduce(fst, nextPartialResult)
        return first.map({
            dropFirst().reduce($0, nextPartialResult)
        })
    }
}

if let a = [1,2,3,4].reduce(+){
    print(a)
}





























