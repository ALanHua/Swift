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

