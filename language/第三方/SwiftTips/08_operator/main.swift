//
//  main.swift
//  08_operator
//
//  Created by yhp on 2017/11/1.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

struct Vector2D {
    var x = 0.0
    var y = 0.0

}

extension Vector2D{
    static func +(letf:Vector2D,right:Vector2D) -> Vector2D {
        return Vector2D(x: letf.x + right.x, y: letf.y + right.y)
    }
}
// associativity 结合律 left -> 从左到右，right -> 从右到左，nono
precedencegroup DotProductPrecedence{
    associativity: none
    higherThan:MultiplicationPrecedence
}
infix operator +*: DotProductPrecedence
extension Vector2D{
    static func +* (letf:Vector2D,right:Vector2D) -> Double {
        return letf.x * right.x + letf.y * right.y
    }
}

let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 1.0, y: 4.0)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
let v4 = v1 + v2
let v5 = v1 +* v2
print(v3)
print(v4)
print(v5)

