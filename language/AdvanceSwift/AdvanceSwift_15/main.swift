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







