//
//  main.swift
//  13_typealias
//
//  Created by yhp on 2017/11/6.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func distance(from point:CGPoint,to anotherPoint:CGPoint) -> Double {
    let dx = Double(anotherPoint.x - point.x)
    let dy = Double(anotherPoint.y - point.y)
    return sqrt(dx * dx + dy * dy)
}

let origin:CGPoint = CGPoint(x: 0,  y: 0)
let point:CGPoint  = CGPoint(x: 1, y: 1)
let d: Double = distance(from: origin, to: point)
print(d)

// good style
typealias Location = CGPoint
typealias Distance = Double

func distance2(from location:Location,to anotherLocation:Location) -> Distance {
    let dx = Distance(location.x - anotherLocation.x)
    let dy = Distance(location.y - anotherLocation.y)
    return sqrt(dx * dx + dy * dy)
}

let origin1:CGPoint = CGPoint(x: 0,  y: 0)
let point1:CGPoint  = CGPoint(x: 1, y: 1)
let d1: Distance = distance2(from: origin, to: point1)
print(d1)

class Person<T> {}
typealias Workld = String
typealias Worker = Person<Workld>

protocol Cat {
}
protocol Dog {
}
// & 连接几个协议
typealias Pat = Cat & Dog




















