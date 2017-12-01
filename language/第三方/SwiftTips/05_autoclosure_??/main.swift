//
//  main.swift
//  05_autoclosure_??
//
//  Created by yhp on 2017/10/31.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func logIfTrue(_ predicate:() -> Bool) {
    if predicate() {
        print("True")
    }
}
/**
 If a closure expression is provided as the function or method’s only argument and you provide that expression as a trailing closure, you do not need to write a pair of parentheses () after the function or method’s name when you call the function:
 
 只接受 ()-> T 这样的闭包
 */
logIfTrue({ return 2 > 1})
logIfTrue{ 2 > 1}

func logIfTrue2(_ predicate:@autoclosure () -> Bool) {
    if predicate() {
        print(" 2 True")
    }
}
logIfTrue2(2 > 1)

/**
 ??
 */
var level: Int?
var startLevel = 1
var currentLevel = level ?? startLevel
print(currentLevel)




