//
//  main.swift
//  31_lazy
//
//  Created by yhp on 2017/11/12.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class ClassA {
    lazy var str: String = {
        let str = "Hello"
        print("只在首次访问输出")
        return str
    }()
}
let aClass:ClassA = ClassA()
print("\(aClass.str)")

let data = 1...3
let result = data.lazy.map { (i:Int) -> Int in
    print("正在处理")
    return i * 2
}
print("in")
for i in result {
    print("\(i)")
}
print("out")


