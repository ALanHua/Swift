//
//  main.swift
//  42_protocol_optional
//
//  Created by yhp on 2017/11/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

/// @objc 修饰的协议只能被class实现
@objc protocol OptionalProtocol{
    @objc optional func optionalMethod()
    func necessnaryMethod()
    @objc optional func anotherOptionalMethod()
}
protocol OptionalProtocol2 {
    func optionalMethod()
    func necessnaryMethod()
    func anotherOptionalMethod()
}

extension OptionalProtocol2{
    func optionalMethod(){
        print("optionalMethod")
    }
    func anotherOptionalMethod(){
        print("anotherOptionalMethod")
    }
}
class MyClass: OptionalProtocol2{
    func necessnaryMethod(){
        print("necessnaryMethod")
    }
    func optionalMethod(){
        print(" MyClass->optionalMethod")
    }
}
let obj = MyClass()
obj.optionalMethod()
obj.necessnaryMethod()
obj.anotherOptionalMethod()




