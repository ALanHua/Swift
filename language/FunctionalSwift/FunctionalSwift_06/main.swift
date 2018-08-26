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
// test
//var array2D :[[Int]] = [
//    [13,1,4],
//    [5,1,7,6]
//]
//for i in array2D{
//    for j in i {
//        print(j)
//    }
//}

// 基于字典数的自动补全
func autocomplete(history:[String],textEntered:String) -> [String] {
    return history.filter{ $0.hasPrefix(textEntered)}
}
// 字典数
struct Trie<Element:Hashable>{
    let isElement:Bool
    let children:[Element:Trie<Element>]
}

extension Trie {
    init() {
        isElement = false
        children = [:]
    }
}

extension Trie {
    var elements:[[Element]] {
        var result:[[Element]] = isElement ? [[]] : []
        for (key,value) in children {
            print("\(key),\(value)")
            result += value.elements.map({ [key] + $0})
        }
        return result
    }
}

extension Array {
    var decompose:(Element,[Element])?{
        return isEmpty ? nil : (self[startIndex],Array(self.dropFirst()))
    }
}

func sum(xs:[Int]) -> Int {
    guard let(head,tail) = xs.decompose else {
        return 0
    }
    return head + sum(xs: tail)
}
// 其实是一个鬼东西
func qsort2(input:[Int]) -> [Int] {
    guard let(pivot,rest) = input.decompose else {
        return []
    }
    let lesser  = rest.filter{$0 < pivot}
    let greater = rest.filter {$0 > pivot}
    
    return qsort2(input:lesser) + [pivot] + qsort2(input:greater)
}

extension Trie {
    func lookup(key:[Element]) -> Bool {
        guard let(head,tail) = key.decompose else {
            return isElement
        }
        guard let subtrie = children[head] else {
            return false
        }
        return subtrie.lookup(key: tail)
    }
}

extension Trie {
    func withPrefix(prefix:[Element]) -> Trie<Element>? {
        guard let(head,tail) = prefix.decompose else {
            return self
        }
        guard let remainder = children[head] else {
            return nil
        }
        return remainder.withPrefix(prefix: tail)
    }
}

extension Trie {
    func autocomplete(key:[Element]) -> [[Element]] {
        return withPrefix(prefix: key)? .elements ?? []
    }
}

extension Trie {
    init(_ key :[Element]) {
        if let (head,tail) = key.decompose {
            let children = [head:Trie(tail)]
            self = Trie(isElement: false, children: children)
        }else{
            self = Trie(isElement: true, children: [:])
        }
    }
}
// 有点晕
extension Trie {
    func insert(key:[Element]) -> Trie<Element> {
        guard let(head,tail) = key.decompose else {
            return Trie(isElement: true, children: children)
        }
//        print("\(head),\(tail)")
        var newChildren = children
        if let nextTrie = children[head]{
            newChildren[head] = nextTrie.insert(key: tail)
        }else{
            newChildren[head] = Trie(tail)
        }
        return Trie(isElement: isElement, children: newChildren)
    }
}

func buildStringTrie(words:[String]) -> Trie<Character> {
    let emptyTrie = Trie<Character>()
    return words.reduce(emptyTrie, { (trie, word)  in
        trie.insert(key: Array(word))
    })
}

func autocompleteString(knownWords:Trie<Character>,word:String) -> [String] {
    let chars = Array(word)
    let completed = knownWords.autocomplete(key: chars)
    return completed.map({ chars  in
        word + String(chars)
    })
}

let contents = ["cat","car","cart","dog"]
let trieOfWords = buildStringTrie(words: contents)
let resultDic = autocompleteString(knownWords: trieOfWords, word: "car")
print(resultDic)




