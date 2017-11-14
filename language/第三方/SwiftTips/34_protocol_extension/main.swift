//
//  main.swift
//  34_protocol_extension
//
//  Created by yhp on 2017/11/14.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

protocol A1 {
    func method1() -> String
}

struct B1:A1 {
    func method1() -> String {
        return "hello"
    }
}
let b1 = B1()
print(b1.method1())

let a1:A1 = B1()
print(a1.method1())

protocol A2 {
    func method1() -> String
}
extension A2 {
    func method1() -> String {
        return "hi"
    }
    func method2() -> String {
        return "hi"
    }
}

struct B2:A2 {
    func method1() -> String {
        return "hello"
    }
    func method2() -> String {
        return "hello"
    }
}
let b2 = B2()
print(b2.method1())
print(b2.method2())
print("------------")
let a2 = b2 as A2
print(a2.method1())
print(a2.method2())






