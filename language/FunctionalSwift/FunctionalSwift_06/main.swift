//
//  main.swift
//  FunctionalSwift_06
//
//  Created by yhp on 2018/8/17.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// 枚举

enum Encoding {
    case ASCII
    case NEXTSTEP
    case JapaneseEUC
    case UTF8
}

extension Encoding {
    var nsStringEncoding:String.Encoding {
        switch self {
        case .ASCII:
            return String.Encoding.ascii
        case .NEXTSTEP:
            return String.Encoding.nextstep
        case .JapaneseEUC:
            return String.Encoding.japaneseEUC
        case .UTF8:
            return String.Encoding.utf8
        }
    }
    
}

func localizedEncodingName(encoding:Encoding) -> String {
    return .localizedName(of: encoding.nsStringEncoding)
}

enum LookupError:Error {
    case CaptialNotFound
    case PopulationNotFound
}

enum PopulationResult {
    case Success(Int)
    case Error(LookupError)
}

let exampleSuccess:PopulationResult = .Success(10000)
print(exampleSuccess)

let capitals = [
    "France": "Paris",
    "Spain": "Madrid",
    "The Netherlands": "Amsterdam",
    "Belgium": "Brussels"
]
let cities = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin": 3562]

func populationOfCapital(country:String) -> PopulationResult {
    guard let capital = capitals[country] else {
        return .Error(.CaptialNotFound)
    }
    guard let population = cities[capital] else {
        return .Error(.CaptialNotFound)
    }
    return .Success(population)
}

// 解错误类型的包裹
switch populationOfCapital(country: "France"){
case let .Success(population):
    print("France's capital has \(population) thousand inhabitants")
case let .Error(error):
    print("Error:\(error)")

}

// 添加泛型
let mayors = [
    "Paris": "Hidalgo",
    "Madrid": "Carmena",
    "Amsterdam": "van der Laan",
    "Berlin": "Müller"
]

func mayorOfCapital(country:String) -> String? {
    return capitals[country].flatMap{mayors[$0]}
}

enum Result<T> {
    case Success(T)
    case Error(Error)
}

// 错误处理
func populationOfCapital1(country:String) throws -> Int {
    guard let capital = capitals[country] else {
        throw LookupError.CaptialNotFound
    }
    guard let population = cities[capital] else {
        throw LookupError.PopulationNotFound
    }
    return population
}

do {
    let population = try populationOfCapital1(country: "France")
    print("\(population)")
}catch {
    print("Lookup error \(error)")
}

func ??<T>(result:Result<T>,handleError:(Error)->T) -> T {
    switch result {
    case let .Success(value):
        return value
    case let .Error(error):
        return handleError(error)
    }
}
// 数据类型中的代数学
enum Add<T,U> {
    case InLeft(T)
    case InRight(U)
}
// 这时候的枚举是空的
enum Zero {}

struct Times<T,U> {
    let fst:T
    let snd:U
}

typealias One = ()

// 纯函数式数据结构
func empty<Element>() -> [Element] {
    return []
}

func isEmpty<Element>(set:[Element]) -> Bool {
    return set.isEmpty
}

func contains<Element:Equatable>(x:Element,_ set:[Element]) -> Bool {
    return set.contains(x)
}

func insert<Element:Equatable>(x:Element,_ set:[Element]) -> [Element] {
    return contains(x: x, set) ? set : [x] + set
}

indirect enum BinarySearchTree<Element:Comparable> {
    case Leaf
    case Node(BinarySearchTree<Element>,Element,BinarySearchTree<Element>)
}

let leaf:BinarySearchTree<Int> = .Leaf
let five:BinarySearchTree<Int> = .Node(leaf,5,leaf)

/**
 插播广告,及知识回顾一下
 swift tips 上的例子
 */
class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    var array:[Element]
    var currentIndex = 0
    
    init(array:[Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
     func next() -> Element? {
        if currentIndex < 0 {
            return nil
        }else{
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}
struct ReverseSequence<T>:Sequence {
    var array:[T]
    
    init(array:[T]) {
        self.array = array
    }
    typealias Iterator = ReverseIterator<T>
    
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}
let arr = [0,1,2,3,4]
for i in ReverseSequence(array: arr){
    print("Index \(i) is \(arr[i])")
}

/////////////////////////////////////////////////////////
extension BinarySearchTree {
    init() {
        self = .Leaf
    }
    
    init(_ value:Element) {
        self = .Node(.Leaf,value,.Leaf)
    }
    var count:Int {
        switch self {
        case .Leaf:
            return 0
        case let .Node(left,_,right):
            return 1 + left.count + right.count
        }
    }
}

extension BinarySearchTree {
    var elements:[Element] {
        switch self {
        case .Leaf:
            return []
        case let .Node(left,x,right):
            return left.elements + [x] + right.elements
        }
    }
}

extension BinarySearchTree {
    var isEmpty: Bool {
        if case .Leaf = self {
            return true
        }
        return false
    }
}

extension Sequence {
    func all(predicate:(Iterator.Element)->Bool) -> Bool {
        for x in self where !predicate(x) {
            return false
        }
        return true
    }
}

extension BinarySearchTree where Element:Comparable {
    var isBST : Bool {
        switch self {
        case .Leaf:
            return true
        case let .Node(left,x,right):
            return left.elements.all(predicate: { y in
                y < x
            }) && right.elements.all(predicate: { y in
                y > x
            }) && left.isBST && right.isBST
        }
    }
}

extension BinarySearchTree {
    func contains(x:Element) -> Bool {
        switch self {
        case .Leaf:
            return false
        case let .Node(_,y,_) where x==y:
            return true
        case let .Node(left,y,_) where x < y:
            return left.contains(x: x)
        case let .Node(_,y,right) where x > y:
            return right.contains(x: x)
        default:
            fatalError("Error")
        }
    }
}

extension BinarySearchTree {
    mutating func insert(x:Element){
        switch self {
        case .Leaf:
            self = BinarySearchTree(x)
        case .Node(let left,let y,let right):
            var left1 = left
            var right1 = right
            if x < y {
                left1.insert(x: x)
            }
            if x > y {
                right1.insert(x: x)
            }
            self = .Node(left1,y,right1)
        }
    }
}

let myTree :BinarySearchTree<Int> = BinarySearchTree()
var copied = myTree
copied.insert(x: 5)
print(myTree.elements)
print("copied \(copied.elements)")
// 基于字典数的自动补全

func autocomplete(history:[String],textEntered:String) -> [String] {
    return history.filter{ $0.hasPrefix(textEntered)}
}
// 字典数
struct Trie<Elemen:Hashable>{
    let isElement:Bool
    let children:[Elemen:Trie<Elemen>]
}




