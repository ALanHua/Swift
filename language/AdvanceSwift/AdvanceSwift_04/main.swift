//
//  main.swift
//  AdvanceSwift_04
//
//  Created by yhp on 2018/9/19.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// 结构体和类
let mutableArray:NSMutableArray = [1,2,3]
let otherArray = mutableArray
otherArray.add(4)
print(mutableArray)
print(otherArray)
class BinaryScanner{
    var position:Int
    let data:Data
    
    init(data:Data) {
        self.data     = data
        self.position = 0
    }
}
extension BinaryScanner{
    func scanByte() -> UInt8? {
        guard position < data.endIndex else {
            return nil
        }
        position += 1
        return data[position - 1]
    }
}

func scanRemainingBytes(scanner:BinaryScanner) {
    while let byte = scanner.scanByte(){
        print(byte)
    }
}

let scanner = BinaryScanner(data: Data("hi".utf8))
scanRemainingBytes(scanner: scanner)

struct Point {
    var x : Int
    var y : Int
}
struct Size {
    var width :Int
    var height:Int
}

struct Rectangle {
    var orign:Point
    var size:Size
}

extension Point {
    static let zero = Point(x: 0, y: 0)
}

extension Rectangle {
    init(x:Int = 0,y:Int = 0,width:Int,height:Int) {
        orign = Point(x: x, y: y)
        size = Size(width: width, height: height)
    }
}

let rect = Rectangle(orign: Point.zero, size: Size(width: 320, height: 480))
var screen = Rectangle(width: 320, height: 480){
    didSet{
        print("screen change \(screen)")
    }
}
screen.orign.x = 10
func +(lhs:Point,rhs:Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}
extension Rectangle {
    mutating func translate(by offset:Point){
        orign = orign + offset
    }
}
screen.translate(by: Point(x: 10, y: 10))
print(screen)

// mutating 只能在对于实例被var 声明的时候使用
// 属性的setter 自身就是mutating的，你无法调用一个let 变量的setter
extension Rectangle {
    func translated(by offset:Point) -> Rectangle{
        var copy = self
        copy.translate(by: offset)
        return copy
    }
}

// inout 关键字
func translateByTwentyTwenty(rectangle:inout Rectangle) {
    rectangle.translate(by: Point(x: 20, y: 20))
}

var input:[UInt8] = [0x0b,0xad,0xf0,0x0d]
var other:[UInt8] = [0x0d]
var d = Data(bytes: input)
var e = d
d.append(contentsOf: other)
print(d)
print(e)













