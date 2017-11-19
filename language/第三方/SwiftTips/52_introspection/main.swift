//
//  main.swift
//  52_introspection
//
//  Created by yhp on 2017/11/19.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class ClassA:NSObject{}
class ClassB:ClassA {}

let obj1:NSObject = ClassA()
let obj2:NSObject = ClassB()
print(obj1.isKind(of: ClassA.self))
print(obj2.isMember(of: ClassA.self))

let obj:AnyObject = ClassB()
if obj is ClassA {
    print("属于ClassA")
}
if obj is ClassB{
    print("属于ClassB")
}
