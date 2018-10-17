//
//  main.swift
//  AdvanceSwift_08
//
//  Created by yhp on 2018/10/15.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

struct Address {
    var street: String
    var city: String
    var zipCode: Int
}

struct Person {
    let name : String
    var address : Address
}

let streetKeyPath = \Person.address.street
let nameKeyPath = \Person.name
print(streetKeyPath)

let simpsonResidence = Address(street: "1094 street", city: "HangZhou", zipCode: 987)
var lisa = Person(name: "lisa", address: simpsonResidence)
print(lisa[keyPath:nameKeyPath])

lisa[keyPath:streetKeyPath] = "12 street"

// 可以通过函数建模的键路径
let nameCountKeyPath = nameKeyPath.appending(path: \.count)
print(nameCountKeyPath)

typealias SortDescriptor<Value> = (Value,Value) -> Bool

func sortDescriptor<Value,Key>(key:@escaping(Value)->Key)-> SortDescriptor<Value> where Key: Comparable {
    return {
        key($0) < key($1)
    }
}

let streetSD:SortDescriptor<Person> = sortDescriptor { $0.address.street}

func sortDescriptor<Value,Key>(key:KeyPath<Value,Key>) -> SortDescriptor<Value> where Key:Comparable {
    return {
        $0[keyPath:key] < $1[keyPath:key]
    }
}

let streetSDKeyPath:SortDescriptor<Person> = sortDescriptor(key:\.address.street)

// 可写键路径
/**
 暂时略过
 */
// 自动闭包
func and(_ l:Bool,_ r:@autoclosure()->Bool) -> Bool {
    guard l else {
        return false
    }
    return r()
}
let evens = [2,4,8]

if and(!evens.isEmpty, evens[0] > 10) {
    print("success")
}

// #file ,#function #line 这个是调试标记法,类似linux中的__FILE__ ..
func log(ifFile condition:Bool,message:@autoclosure () ->(String),
         file:String = #file,function: String = #function,line: Int = #line) {
    guard !condition else {
        return
    }
    print("Assertion failed \(message()),\(file),\(function),\(line)")
}

// @escaping 标注 ，闭包默认是非逃逸的

// withoutActuallyEscaping
extension Array {
    // 该方法 lazy 集合表示上的filter 接受y的是一个逃逸闭包
//    func all(matching predicate:(Element) -> Bool) -> Bool {
//        return self.lazy.filter({ predicate($0)
//        })
//    }
    func all(matching predicate:(Element) -> Bool) -> Bool{
        return withoutActuallyEscaping(predicate, do: {
            escapablePredicate in
            self.lazy.filter({ !escapablePredicate($0)
            }).isEmpty
        })
    }
}

let areAllOneDigit = [1,2,3,4].all { $0 < 10}
print(areAllOneDigit)

// 字符串
let single = "Pok\u{00e9}mon"
let double = "Poke\u{0301}mon"
print(single.count)
print(double.utf16.count)
print(single.utf16.count)

let crlf = "\r\n"
print(crlf.count)
// 颜文字
let oneEmoji = "😂"
print(oneEmoji.count)

let flags = "🇧🇷🇳🇿"
let flags2 = flags.unicodeScalars.map {
    "U+\(String($0.value,radix:16,uppercase:true))"
}
print(flags.count)
print(flags2)

// 字符串和集合
extension String {
//    O(1)
    var allPrefixes1:[Substring] {
        return (0...self.count).map(self.prefix)
    }
//    O(1)
    var allPrefixes2:[Substring] {
        return [""] + self.indices.map({ (index) in
            self[...index]
        })
    }
    
}

let hello = "Hello"
print(hello.allPrefixes1)
print(hello.allPrefixes2)

// 范围可替换，而h非可变
var greeting = "Hello,world"
if let comma = greeting.index(of:","){
    print(greeting[..<comma])
    greeting.replaceSubrange(comma..., with: " again")
}
print(greeting)

// 字符串索引
let s = "abcdef"
let second = s.index(after: s.startIndex)
print(s[second])

let sixth = s.index(second, offsetBy: 4)
print(s[sixth])

let safeIdx = s.index(s.startIndex, offsetBy: 400, limitedBy: s.endIndex)
//print(safeIdx)
print(s.prefix(4))

// 遍历字符串
for (i,c) in s.enumerated() {
    print("\(i),\(c)")
}
// 查找特定字符
var hello2 = "Hello!"
if let idx = hello2.index(of:"!"){
    hello2.insert(contentsOf: " andy", at: idx)
}
print(hello2)

// 子字符串
