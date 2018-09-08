//
//  main.swift
//  AdvanceSwift_02
//
//  Created by yhp on 2018/9/7.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

struct Constrantiterator:IteratorProtocol {
    typealias Element = Int
    mutating func next() -> Int? {
        return 1
    }
}

//var iterator = Constrantiterator()
//while let x = iterator.next() {
//    print(x)
//}
struct FibsIterator:IteratorProtocol {
    var state = (0,1)
//    好简单的逻辑，用了元组
    mutating func next() -> Int?{
        let upcomingNumber = state.0
        state = (state.1,state.0 + state.1)
        return upcomingNumber
    }
}

struct PrefixIterator:IteratorProtocol {
    let string:String
    var offset:String.Index
    
    init(string:String) {
        self.string = string
        offset = string.startIndex
    }
    
    mutating func next() -> Substring?{
        guard offset < string.endIndex else {
            return nil
        }
        offset = string.index(after: offset)
        return string[..<offset]
    }
}

struct PrefixSequence:Sequence {
    let string:String
    func makeIterator() -> PrefixIterator {
        return PrefixIterator(string: string)
    }
}

for prefix in PrefixSequence(string: "Hello"){
    print(prefix)
}

let prefixSequence = PrefixSequence(string: "Andy")
print(prefixSequence.map({ $0.uppercased()}))

// 迭代器和值语义
let seq = stride(from: 0, to: 10, by: 1)
var i1 = seq.makeIterator()
print(i1.next()!)
print(i1.next()!)
var i2 = i1
print(i1.next()!)
print(i1.next()!)
print(i2.next()!)
print(i2.next()!)
print("----------------")
// AnyIterator 引用语义
var i3 = AnyIterator(i1)
var i4 = i3
print(i3.next()!)
print(i4.next()!)
print(i3.next()!)
print(i3.next()!)
// AnyIterator 初始化方法可以直接传入一个next函数
func fibsIterator() -> AnyIterator<Int> {
    var state = (0,1)
    return AnyIterator{
        let upcomingNumber = state.0
        state = (state.1,state.0 + state.1)
        return upcomingNumber
    }
}

let fibsSequence = AnySequence(fibsIterator())
print(Array(fibsSequence.prefix(10)))

// 不稳定序列
let standardIn = AnySequence {
    return AnyIterator {
        readLine()
    }
}

let numberedStdIn = standardIn.enumerated()
//for(i,line) in numberedStdIn {
//    print("\(i+1):\(line)")
//}

// 序列和迭代器之间的关系
/**
 其实对于所有的迭代器来说,都可以将他们看作是即将返回的元素所组成
 的不稳定序列
 */
extension Sequence where Element:Equatable,
    SubSequence:Sequence,
    SubSequence.Element == Element{
    func headMirrorsTail(_ n:Int) -> Bool {
        let head = prefix(n)
        let tail = suffix(n).reversed()
        return head.elementsEqual(tail)
    }
}

let equalSeq = [1,2,3,4,2,1].headMirrorsTail(2)
print(equalSeq)

// 链表
// note:indirect 在这里是告诉编译器这个媒介的node 应该被看作引用
enum List<Element> {
    case end
    indirect case node(Element,next:List<Element>)
}
extension List {
    func cons(_ x:Element) -> List {
        return .node(x,next:self)
    }
}
let emptyList = List<Int>.end
let oneElementList = List.node(1, next: emptyList)
let list = List<Int>.end.cons(1).cons(2).cons(3)
print(list)
// 链式的链表看上去很丑








