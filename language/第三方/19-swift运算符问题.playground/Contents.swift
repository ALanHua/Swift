//: Playground - noun: a place where people can play

import UIKit
import Swift
/*
 运算符重载
 */
func * (left:String,right:Int) -> String{
    if right <= 0 {
        return ""
    }
    var result = left
    for _ in 1..<right {
        result += left
    }
    return result
}
"a" * 6

[1,2] + [3,4]

func +(left:[Double],right:[Double]) ->[Double]{
    var sum = Array(repeating: 0.0, count: left.count)
    for (i,_) in  left.enumerated(){
        sum[i] = left[i] + right[i]
    }
    return sum
}

[1.0,2.0] + [3.0,4.0]

/*自定义运算符
 infix: 指定它是一个二元操作符，有左右两个值
 
 */
infix operator ** {associativity left precedence 160 }

func ** (left:Double,right:Double)->Double{
    return pow(left, right)
}

2 ** 3

prefix operator √ {}

prefix func √ (number:Double) ->Double{
    return sqrt(number)
}

√16

infix operator ± {associativity left precendence 140}
func ±(left:Double,right:Double) -> (Double,Double){
    return (left + right,left - right)
}

prefix operator ± {}

prefix func  ± (value:Double)->(Double,Double){
    return 0  ± value
}

2 ± 3
±4

/*
 官方资料
 */
struct Vector2D{
    var x = 0.0,y = 0.0
}

extension Vector2D{
    /*结构体方法*/
    static func + (left: Vector2D, right: Vector2D) -> Vector2D{
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print(combinedVector)

extension Vector2D {
    static prefix func - (vector : Vector2D) -> Vector2D{
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsopositive = -negative
print(positive,negative,alsopositive)

extension Vector2D{
    static func += (left: inout Vector2D,right: inout Vector2D){
        left = left + right
    }
}

var  original = Vector2D(x: 1.0, y: 2.0)
var vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print(original)

extension Vector2D{
    static func == (left: Vector2D,right: Vector2D) -> Bool{
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D,right: Vector2D) -> Bool{
        return !(left == right)
    }
}
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}else{
    print("These two vectors are different.")
}
/*自定义运算符*/
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print(plusMinusVector)



















