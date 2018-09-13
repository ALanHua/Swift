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






