//
//  main.swift
//  FunctionalSwift05
//
//  Created by yhp on 2018/8/13.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// Swift 版本的QuickCheck库
protocol Smaller {
    func smaller() -> Self?
}

protocol Arbitrary :Smaller{
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
    func smaller() -> Int? {
        return self == 0 ? nil : self / 2
    }
}

extension Int {
    static func random(from:Int,to:Int) -> Int {
        return from + (Int(arc4random()) % (to - from))
    }
}

extension Character:Arbitrary{
    func smaller() -> Character? {
        return Character(UnicodeScalar(Int.random(from: 70, to: 90))!)
    }
    
    static func arbitrary() -> Character {
        //  字符的ASCII码
        return Character(UnicodeScalar(Int.random(from: 65, to: 90))!)
    }
}

func tabulate<A>(times:Int,transform:(Int)->A) -> [A] {
    return (0..<times).map(transform)
}

extension String:Arbitrary {
    func smaller() -> String? {
        return isEmpty ? nil : String(self.dropFirst())
    }
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
    func smaller() -> CGFloat? {
        return CGFloat(arc4random() / 2)
    }
    
    static func arbitrary() -> CGFloat {
        return CGFloat(arc4random())
    }
}

extension CGSize:Arbitrary {
    func smaller() -> CGSize? {
       return CGSize(width: CGFloat.arbitrary() / 2, height: CGFloat.arbitrary() / 2)
    }
    
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

// 缩小范围
check1(message: "“Every string starts with Hello") { (s:String) -> Bool in
    s.hasPrefix("Hello")
}


print(100.smaller()!)
print("hello".smaller()!)

func iterateWhile<A>(condition:(A) -> Bool,initial:A,next:(A) -> A?) -> A {
    if let x = next(initial), condition(x){
        return iterateWhile(condition: condition, initial: x, next: next)
    }
    return initial;
}

func check2<A:Arbitrary>(message:String,_ property:(A)->Bool) -> (){
    let numberOfIterations = 10
    for _ in 0..<numberOfIterations {
        let value = A.arbitrary()
        guard property(value) else{
            let smallerValue = iterateWhile(condition: { !property($0)
            }, initial: value) { $0.smaller()}
            print("\"\(message)\" doesn't hold:\(smallerValue)")
            return
        }
        print("\"\(message)\" passed:\(numberOfIterations)")
    }
}
// 随机数组
/*
 这排序算法写的 666
 但需要优化，思想是一样的
 */
func qsort(array:inout [Int]) -> [Int] {
//    出口处也可以在优化
    if array.isEmpty {
        return []
    }
    // 这个小标的选择还可以优化
    let pivot  = array.remove(at: 0)
    var lesser = array.filter {$0 < pivot}
    var greater = array.filter {$0 > pivot}
    
    return qsort(array: &lesser) + [pivot] +  qsort(array: &greater)
}
extension Array: Smaller {
    func smaller() -> Array<Element>? {
        guard !isEmpty else {
            return nil
        }
        return Array(dropFirst())
    }
}

//extension Array :Arbitrary {
//    static func arbitrary() -> Array<Element> {
//        let randomLength = Int(arc4random() % 50)
//        return tabulate(times: randomLength, transform: { _ in
//
//        })
//    }
//}

var arr = [3,2,1,7,8,10]
print(arr)
print(qsort(array:&arr))

// 需要后续确认如何修改
//check2(message:  "qsort should behave like sort") { (x:[Int]) -> Bool in
//    var localX = x
//    let a = qsort(array:&localX)
//    let b = x.sorted(by: <)
//    return a == b
//}











