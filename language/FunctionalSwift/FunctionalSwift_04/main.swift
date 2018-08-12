//
//  main.swift
//  FunctionalSwift_04
//
//  Created by yhp on 2018/8/12.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// 泛型和Any类型
func noOp<T>(x:T) -> T {
    return x
}

func noOpAny(x:Any) -> Any {
    return x
}

infix operator >>>: BitwiseShiftPrecedence
func >>><A,B,C>(f:@escaping (A)->B,g:@escaping(B)->C) -> (A)->C {
    return {x in
        g(f(x))
    }
}
// 柯里化版本 比较深奥，暂时还有点晕
func curry<A,B,C>(f:@escaping (A,B)->C) -> (A)->(B) ->C {
    return{x in{y in f(x,y)}}
}

let result = curry { (a, b) -> Int in
    return a + b
}
print(result(3)(4))

// 字典
let cities = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin": 3562]
guard let madridPopulation:Int = cities["Madrid"] else{
    fatalError()
}
print(madridPopulation)

// 可选值绑定
if let madridPopulation2 = cities["Madrid"] {
    print("\(madridPopulation2 * 1000)")
}else{
    print("Unknown city:Madrid")
}

// 可选值链
struct Address {
    let streetName: String
    let city: String
    let state: String
}

struct Person {
    let name: String
    let address: Address?
    
}
struct Order {
    let orderNumber:Int
    let person:Person?
}

/*
 order.person!.address!.state!
 如果任意中间数据缺失就会导致运行异常
 故：
 if let myState = order.person?.address?.state {
    print("This order will be shipped to \(myState)")
 }
 */
let order = Order(orderNumber: 101, person: Person(name: "Andy", address: Address(streetName: "11", city: "HZ", state: "China")))
if let myState = order.person?.address?.state {
    print("This order will be shipped to \(myState)")
}else{
    print("Unknown")
}
// 分支上的可选值
let madridPopulation3 = cities["Madrid"]

switch madridPopulation3 {
    case 0?: print("Nobody in madrid")
    case (1..<1000)?: print("0....10000")
    case .some(let x):print("people \(x)")
    case .none:print("Unknown")
}
// guard 关键值用法如上




