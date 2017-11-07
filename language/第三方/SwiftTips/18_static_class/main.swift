//
//  main.swift
//  18_static_class
//
//  Created by yhp on 2017/11/7.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

struct Point {
    let x: Double
    let y: Double
//    存储属性
    static let zero = Point(x: 0, y: 0)
//    计算属性
    static var ones:[Point] {
        return [Point(x: 1, y: 1),
                Point(x: -1, y: 1),
                Point(x: 1, y: -1),
                Point(x: -1, y: -1)]
    }
//    类型方法
    static func add(p1:Point,p2:Point)-> Point{
        return Point(x: p1.x + p2.x, y: p1.y + p2.y)
    }
}

print(Point.zero)
print(Point.ones)
print(Point.add(p1: Point.zero, p2: Point.ones[0]))

// class 不能有存储属性
protocol MyProtocol {
    static func foo() ->String
}

struct MyStruct:MyProtocol {
    static func foo() -> String {
        return "MyStruct"
    }
}

enum MyEnum:MyProtocol {
    static func foo() -> String {
        return "MyEnum"
    }
}

class MyClass: MyProtocol {
//   类中既可以使用class，也可以使用static
    class func foo() -> String {
        return "MyClass.foo()"
    }
    static func bar() -> String{
        return "MyClass.bar()"
    }
}

print(MyClass.foo())





