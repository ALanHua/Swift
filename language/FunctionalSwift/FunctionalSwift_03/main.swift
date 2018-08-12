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

// Filter
let exampleFiles = ["README.md", "HelloWorld.swift", "FlappyBird.swift"]
func getSwiftFiles(files:[String]) -> [String] {
    var result:[String] = []
    for file in files {
        if file.hasSuffix(".swift"){
             result.append(file)
        }
    }
    return result
}
print(getSwiftFiles(files: exampleFiles))

extension Array {
    func filter(includeElement:(Element) -> Bool) ->[Element] {
        var result:[Element] = []
        for x in self where includeElement(x) {
            result.append(x)
        }
        return result
    }
}

func getSwiftFiles2(files:[String]) -> [String] {
    return files.filter(includeElement: { (file) -> Bool in
        file.hasSuffix(".swift")
    })
}

print(getSwiftFiles2(files: exampleFiles))

// Reduce
func sum(xs:[Int]) -> Int {
    var result:Int = 0
    for x in xs {
        result += x
    }
    return result
}

print(sum(xs: [1,2,3,4,5]))

func product(xs:[Int]) -> Int {
    var result :Int = 1
    for x in xs {
        result *= x
    }
    return result
}

func concatenate(xs:[String]) -> String {
    var result:String = ""
    for x in xs {
        result += x
    }
    return result
}

func prettyPrintArray(xs:[String]) -> String {
    var result:String = "Andy wa ha ha"
    for x in xs {
        result = " " +  result + x + "\n"
    }
    return result
}

extension Array {
    func reduce<T>(initial:T,combine:(T,Element) ->T) -> T {
        var result = initial
        for x in self {
            result = combine(result,x)
        }
        return result
    }
}
func sumUsingReduce(xs:[Int]) -> Int {
    return xs.reduce(initial: 0, combine: { (result, x) in
        result + x
    })
}

func productUsingReduce(xs:[Int]) -> Int {
    return xs.reduce(initial: 1, combine:*)
}

func concatenateUsingReduce(xs:[String]) -> String {
    return xs.reduce(initial: "", combine: +)
}


/// 将n维数组降维成一维数组
/// - Parameter xss: n维数组
/// - Returns: 一维数组
func flatten<T>(xss:[[T]]) -> [T] {
    var result:[T] = []
    for xs in xss {
        result += xs
    }
    return result
}
print(flatten(xss: [[1,2,3],[4,5,6,7],[8,9]]))

func flattenUsingReduce<T>(xss:[[T]]) -> [T] {
    return xss.reduce(initial: [], combine: { (result, xs) in
        result + xs
    })
}

// 利用Reduce 重新定义map filter

extension Array {
    func mapUsingReduce<T>(transform:(Element) -> T) -> [T] {
        return reduce(initial: [], combine: { (result, x) in
            return result + [transform(x)]
        })
    }
    
    func filterUsingReduce(includeElement:(Element)->Bool) -> [Element] {
        return reduce(initial: [], combine: { (result, x) in
            return includeElement(x) ? result + [x]: result
        })
    }
}

// 小例子
struct City {
    let name:String
    let population:Int
}
let paris = City(name: "Paris", population: 2341)
let madrid = City(name: "Madrid", population: 3165)
let amsterdam = City(name: "Amsterdam", population: 827)
let berlin = City(name: "Berlin", population: 3562)
let cities = [paris,madrid,amsterdam,berlin]

extension City {
    func cityByScalingPopular() -> City {
        return City(name: name, population: population * 1000)
    }
}

let result = cities.filter { (city) -> Bool in
    city.population > 1000
    }.map { $0.cityByScalingPopular()}
    .reduce(initial: "City:Population") { (result, c) in
        return result + "\n" + "\(c.name):\(c.population)"
}
print(result)




