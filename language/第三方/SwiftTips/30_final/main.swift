//
//  main.swift
//  30_final
//
//  Created by yhp on 2017/11/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class Person {
    final func method(){
        print("开始配置")
        methodImp()
        print("结束配置")
    }
    func methodImp() {
        fatalError("子类必须实现这个方法")
    }
}

class Child: Person {
    override func methodImp() {
        print("child")
    }
}

let aPerson = Child()
aPerson.method()


