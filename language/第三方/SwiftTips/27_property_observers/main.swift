//
//  main.swift
//  27_property_observers
//
//  Created by yhp on 2017/11/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class MyClass {
    let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
    var date : NSDate{
        willSet{
            let d = date
            print("\(d)->\(newValue)")
        }
        didSet{
            if date.timeIntervalSinceNow  > oneYearInSecond{
                print("设定的时间太晚了！")
                date = NSDate().addingTimeInterval(oneYearInSecond)
            }
            print("\(oldValue)->\(date)")
        }
    }
    
    init() {
        date = NSDate()
    }
}

let foo = MyClass()

foo.date = foo.date.addingTimeInterval(1000_000_000)

class A {
    var number:Int{
        get{
            print("get")
            return 1
        }
        set {
            print("set")
        }
    }
}

class B: A {
    override var number: Int{
        willSet{
            print("willSet")
        }
        didSet{
           print("didSet")
        }
    }
}
let b = B()
b.number = 0





