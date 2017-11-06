//
//  main.swift
//  15_mutiparamter
//
//  Created by yhp on 2017/11/6.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func sum(input:Int...) -> Int {
    return input.reduce(0, +)
}

print(sum(input: 1,2,3,4,5))

func myFunc(numbers:Int...,string:String) {
    numbers.forEach {
        for i in 0..<$0{
            print("\(i + 1):\(string)")
        }
    }
}

myFunc(numbers: 1,2,3, string: "hello")


