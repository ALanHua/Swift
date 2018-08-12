//
//  main.swift
//  FunctionalSwift_03
//
//  Created by yhp on 2018/8/12.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation
// MARK: Map Filter Reduce

func incrementArray(xs:[Int]) -> [Int] {
    var result:[Int] = []
    for x in xs {
        result.append(x+1)
    }
    return result
}

func doubleArray1(xs:[Int]) -> [Int] {
    var result:[Int] = []
    for x in result {
        result.append(x * 2)
    }
    return result
}

func computeIntArray(xs:[Int],transform:(Int)->Int) -> [Int] {
    var result :[Int] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

func doubleArray2(xs:[Int]) -> [Int]{
    return computeIntArray(xs: xs, transform: { (x) -> Int in
        x*2
    })
}

//func isEvenArray(xs:[Int]) -> [Bool] {
//    computeIntArray(xs: xs) { (x) -> Int in
//        x % 2 == 0
//    }
//}

func genericComputeArray1<T>(xs:[Int],transfrom:(Int) -> T) -> [T] {
    var result:[T] = []
    for x in xs {
        result.append(transfrom(x))
    }
    return result
}

let numArray = genericComputeArray1(xs: [1,2,3,4,5]) { (x) -> Bool in
    x % 2 == 0
}

print(numArray)

func map<Element,T>(xs:[Element],transform:(Element) -> T) -> [T] {
    var result:[T] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

print(map(xs: [2,3,4,5], transform: { (x) -> Int in
    x * 2
}))

func genericComputeArray2<T>(xs:[Int],transform:(Int)->T) -> [T] {
    return map(xs: xs, transform: transform)
}

extension Array {
    func map<T>(transform:(Element) -> T) -> [T] {
        var result:[T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

func genericComputeArray3<T>(xs:[Int],transform:(Int)->T) -> [T] {
    return xs.map(transform: transform)
}


