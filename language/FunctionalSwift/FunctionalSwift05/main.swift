//
//  main.swift
//  FunctionalSwift05
//
//  Created by yhp on 2018/8/13.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// Swift 版本的QuickCheck库

protocol Arbitrary {
    /*
     为什么使用Self 可以参考<<swift 100 tips >>
     返回协议本身
     */
    static func arbitrary() -> Self
}

extension Int:Arbitrary {
    static func arbitrary() -> Int {
        return Int(arc4random())
    }
}






