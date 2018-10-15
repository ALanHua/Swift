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


