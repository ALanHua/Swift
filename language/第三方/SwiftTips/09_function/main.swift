//
//  main.swift
//  09_function
//
//  Created by yhp on 2017/11/1.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation
/**
 其实 variable:Int 等效于 variable: let Int
 */
func incrementor(variable:Int) -> Int {
    return variable + 1
}

let a = incrementor(variable: 5)
print(a)

func incrementor2(variable:Int) -> Int {
    var num = variable
    num += 1
    return num
}

let b = incrementor2(variable: 7)
print(b)

func incrementor3(variable:inout Int) {
    variable += 1
}
var luckyNumber = 7
incrementor3(variable: &luckyNumber)
print(luckyNumber)

func makeIncrementor(addNumber:Int) -> ((inout Int) -> ()) {
    func incrementor(variable:inout Int) ->(){
        variable += addNumber
    }
    return incrementor;
}

var input = 10
let incrementor = makeIncrementor(addNumber: 2)
incrementor(&input)
print(input)



