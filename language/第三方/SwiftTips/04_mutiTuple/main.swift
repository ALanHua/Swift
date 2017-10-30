//
//  main.swift
//  04_mutiTuple
//
//  Created by yhp on 2017/10/30.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func swapMe1<T>(a:inout T,b:inout T)  {
    let temp = a
    a  = b
    b  = temp
}
func swapMe2<T>(a:inout T,b:inout T)  {
    (a,b) = (b,a)
}
var a = 1
var b = 2
print(a,b)
swapMe2(a: &a, b: &b)
print(a,b)

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let (small,large) = rect.divided(atDistance: 20, from: .maxXEdge)
print(small)
print(large)

