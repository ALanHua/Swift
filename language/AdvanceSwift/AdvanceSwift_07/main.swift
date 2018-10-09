//
//  main.swift
//  AdvanceSwift_07
//
//  Created by yhp on 2018/10/9.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

func printInt(i:Int) {
    print("you passed \(i)")
}

let funVar = printInt
funVar(2)

// 接受函数作为参数的函数
func useFunction(function:(Int)->()) {
    function(3)
}
useFunction(function: printInt)
useFunction(function: funVar)

// 函数作为返回值
func returnFunc() -> (Int)->(String) {
    func innerFunc(i:Int) -> String {
        return "ypou win \(i)"
    }
    return innerFunc
}

let myFunc = returnFunc()
print(myFunc(4))

// 函数可以捕获存在于他们作用范围之外的变量
func counterFunc() -> (Int) -> String {
    var counter = 0
    func innerFunc(i:Int) -> String {
        counter += i //  counter 被捕获了
        return "running : \(counter)"
    }
    return innerFunc
}

let f = counterFunc()
print(f(3))
print(f(4))

let g = counterFunc()
print(g(2))
print(g(2))
print(f(2))

//  函数可以使用{} 来声明闭包表达式

func doubler(i:Int) -> Int {
    return i * 2
}
print([1,2,3,4].map(doubler))

let doublerAlt = {
    (i:Int) -> Int in
    return i * 2
}
print([1,2,3,4].map(doublerAlt))

/**
 闭包的特性
 0，如果你将闭包作为参数传递，并且你不再用这个闭包做其他事情
    的话，就没必要将个存储到一个剧本变量中
 1，如果编译器可以上下文推断出类型的话，你不需要指明它
 2，如果闭包表达式的主体部分只包括一个单一的表达式的话
    它将自动h返回这个表达式的结果，你可以不写return
 3, Swift 会自动为函数的参数提供简写形式，$0 代表第一个参数，$1 代表第二个参数，以此类推。”
 4, 如果函数的最后一个参数是闭包表达式的话，你可以将这个闭包表达式移到函数调用的圆括号的外部。这样的尾随闭包语法在多行的闭包表达式中表现非常好，因为它看起来更接近于装配了一个普通的函数定义，或者是像 if (expr) { } 这样的执行块的表达形式
 5, 最后，如果一个函数除了闭包表达式外没有别的参数，那么方法名后面的调用时的圆括号也可以一并省略”
 */
print([1,2,3].map({ (i:Int) -> Int in
    return i * 2
}))
print([1,2,3].map({ i in
    return i * 2
}))
print([1,2,3].map({ i in
     i * 2
}))
print([1,2,3].map({ $0 * 2}))
print([1,2,3].map(){ $0 * 2})
print([1,2,3].map{$0 * 2})
