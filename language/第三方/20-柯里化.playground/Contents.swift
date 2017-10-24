//: Playground - noun: a place where people can play

import UIKit

func add1(x:Int,_ y:Int) -> Int{
    return x + y
}

add1(x: 2, 3)

func add2(x: Int) -> ((Int) -> Int){
    return{ y in return x + y}
}
add2(x: 1)(2)

func add3(x: Int) -> (Int) -> Int{
    return {y in x + y}
}