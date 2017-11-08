//
//  main.swift
//  24_AnyClass_.self
//
//  Created by yhp on 2017/11/8.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation


class A {
    class func memthod() {
        print("Hello")
    }
}
let typeA:A.Type = A.self
typeA.memthod()

let anyClass:AnyClass = A.self
(anyClass as! A.Type).memthod()






