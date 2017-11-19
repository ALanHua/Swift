//
//  main.swift
//  46_UsafePointer
//
//  Created by yhp on 2017/11/19.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let arr = NSArray(object:"meow")
let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), to: CFString.self)
print(str)

class MyClass {
    var a = 1
    deinit {
        print("deinit")
    }
}
var pointer:UnsafeMutablePointer<MyClass>!
pointer = UnsafeMutablePointer<MyClass>.allocate(capacity: 1)
pointer.initialize(to: MyClass())
print(pointer.pointee.a)
pointer.deinitialize()
pointer.deallocate(capacity: 1)
pointer = nil

var x:UnsafeMutablePointer<tm>!
var t = time_t()
x = localtime(&t)
print(x)
x = nil






