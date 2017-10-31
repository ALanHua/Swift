//
//  main.swift
//  06_escaping
//
//  Created by yhp on 2017/10/31.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func doWork(block:()->()){
    block()
}

doWork {
    print("work")
}

func doWorkAsync(block:@escaping ()->()) {
    DispatchQueue.main.async {
        print("---------")
        block()
    }
}

class S {
    var foo = "foo"
    func method1(){
        doWork {
            print(foo)
        }
        foo = "bar"
    }
//    由于runloop没有开启，队列也没有办法开启
    func method2(){
        doWorkAsync {
            print(self.foo)
        }
       foo = "bar"
    }
    func method3(){
        doWorkAsync {
            [weak self] in
            print(self?.foo ?? "nil")
        }
        foo = "bar"
    }
}

S().method1()
S().method2()
S().method3()

/**
 协议和父类中定义了逃逸闭包，实现协议的类及父类的子类也要是逃逸闭包
 */
protocol P {
    func work(b:@escaping ()->())
}

class C: P {
    func work(b: @escaping () -> ()) {
        print("in C")
        b()
    }
}




