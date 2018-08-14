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

extension Int {
    static func random(from:Int,to:Int) -> Int {
        return from + (Int(arc4random()) % (to - from))
    }
}

extension Character:Arbitrary{
    static func arbitrary() -> Character {
        //  字符的ASCII码
        return Character(UnicodeScalar(Int.random(from: 65, to: 90))!)
    }
}

func tabulate<A>(times:Int,transform:(Int)->A) -> [A] {
    return (0..<times).map(transform)
}

extension String:Arbitrary {
    static func arbitrary() -> String {
        let randomLength = Int.random(from: 0, to: 40)
        let randomCharacters = tabulate(times: randomLength) {_ in
            Character.arbitrary()
        }
        return String(randomCharacters)
    }
}

print(String.arbitrary())

extension CGSize {
    var area:CGFloat {
        return width * height
    }
}

extension CGFloat:Arbitrary{
    static func arbitrary() -> CGFloat {
        return CGFloat(arc4random())
    }
}

extension CGSize:Arbitrary {
    static func arbitrary() -> CGSize {
        return CGSize(width: CGFloat.arbitrary(), height: CGFloat.arbitrary())
    }
}


// 实现check 函数
func check1<A:Arbitrary>(message:String,_ property:(A)->Bool) -> () {
    let numberOfIterations = 10
    for _ in 0..<numberOfIterations {
        let value = A.arbitrary()
        guard property(value) else{
            print("\"\(message)\" doesn't hold:\(value)")
            return
        }
         print("\"\(message)\" passed:\(numberOfIterations)")
    }
}

check1(message: "Area should be at least 0") { (size: CGSize) in size.area >= 0 }








