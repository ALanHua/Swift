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
extension List:ExpressibleByArrayLiteral{
    init(arrayLiteral elements: Element...) {
        self = elements.reversed().reduce(.end) { (partialList,element)  in
            partialList.cons(element)
        }
    }
}

extension List {
    mutating func push(_ x: Element){
        self = self.cons(x)
    }
    
    mutating func pop() -> Element?{
        switch self {
        case .end:
            return nil
        case let .node(x,next:tail):
            self = tail
            return x
        }
    }
    
}
extension List:IteratorProtocol,Sequence{
    mutating func next() -> Element? {
        return pop()
    }
}

var stack:List<Int> = [3,2,1]
var a = stack
var b = stack
print(a.pop()!)
print(a.pop()!)
print(a.pop()!)
stack.push(4)
print(b.pop()!)
print(b.pop()!)
print(b.pop()!)
print(stack.pop()!)
print(stack.pop()!)
print(stack.pop()!)
print("---------------------")
let list2:List = ["3","2","1"]
for x in list2 {
    print("\(x)")
}
// 使用标准库函数
print(list2.joined(separator: ","))
print(list2.contains("2"))
// 过滤nil值
print(list2.compactMap({Int($0)}))

// 集合类型
protocol Queue {
    associatedtype Element
    mutating func enqueue(_ newElement:Element)
    mutating func dequeue()->Element?
}

struct FIFOQueue<Element>:Queue {
    private var left:[Element] = []
    private var right:[Element] = []
    // 将元素添加到队列最后
    // - 复杂度为O(1）
    mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }
    // 将队列前端移除一个元素
    // - 复杂度为 平摊O(1）
    //   需要使用银行家理论来分析平摊复杂度 
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
    
}

extension FIFOQueue:Collection {
    subscript(position: Int) -> Element {
        precondition((0..<endIndex).contains(position), "Index out of boounds")
        if position < left.endIndex {
            return left[left.count - position]
        }else {
            return right[position - left.count]
        }
    }
    
    public var startIndex:Int{
        return 0
    }
    
    public var endIndex:Int {
        return left.count + right.count
    }
    
    func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    
}

var q = FIFOQueue<String>()
for x in ["1","2","foo","3"] {
    q.enqueue(x)
}

for s in q {
    print(s,terminator:" ")
}
print("\n")

var aq = Array(q)
aq.append(contentsOf: q[2...3])
print(aq)
let qMap = q.map { $0.uppercased()}
print(qMap)
print(q.compactMap({ Int($0)}))
print(q.filter({ $0.count > 1}))
print(q.sorted())
// .....

// 遵守ExpressibleByArrayLiteral
extension FIFOQueue:ExpressibleByArrayLiteral{
   public init(arrayLiteral elements: Element...) {
        left  = elements.reversed()
        right = []
    }
}

let queue:FIFOQueue = [1,2,3]
print(queue)

var str = "Still I see monsters"
print(str.split(separator: " "))

extension Substring {
    var nextWordRange:Range<Index>{
        let start = drop { $0 == " "}
        let end = start.index {$0 == " "} ?? endIndex
        return start.startIndex ..< end
    }
    
}

struct Words:Collection {
    let string: Substring
    let startIndex : WordsIndex
    
    init(_ s: String) {
        self.init(s[...])
    }
    
    private init(_ s: Substring) {
        self.string = s
        self.startIndex = WordsIndex(string.nextWordRange)
    }
    
    subscript(index: WordsIndex) -> Substring{
        return string[index.range]
    }
    
    var endIndex: WordsIndex {
        let e = string.endIndex
        return WordsIndex(e..<e)
    }
    
    func index(after i: WordsIndex) -> WordsIndex {
        guard i.range.upperBound < string.endIndex else {
            return endIndex
        }
        let remainder = string[i.range.upperBound...]
        return WordsIndex(remainder.nextWordRange)
    }
}

struct WordsIndex: Comparable {
    fileprivate let range: Range<Substring.Index>

    fileprivate init(_ value:Range<Substring.Index>) {
        self.range = value
    }
    static func <(lhs:Words.Index,rhs:Words.Index) ->Bool {
        return lhs.range.lowerBound < rhs.range.lowerBound
    }
    static func ==(lhs:Words.Index,rhs:Words.Index) ->Bool {
        return lhs.range == rhs.range
    }
}

print(Array(Words("hello world test")).prefix(1))





