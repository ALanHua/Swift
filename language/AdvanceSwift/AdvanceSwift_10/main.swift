//
//  main.swift
//  AdvanceSwift_10
//
//  Created by yhp on 2018/11/5.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

extension Sequence where Element:Equatable {
    func isSubset(of other:[Element]) -> Bool {
        for element in self {
            guard other.contains(element) else{
                return false
            }
        }
        return true
    }
}

let oneToThree = [1,2,3]
let fiveToOne = [5,4,3,2,1]
let status = oneToThree.isSubset(of: fiveToOne)
print(status)

extension Sequence where Element:Hashable{
    func isSubset(of other:[Element]) -> Bool {
        let  otherSet = Set(other)
        for element in self {
            guard otherSet.contains(element) else{
                return false
            }
        }
        return true
    }
}

extension Sequence where Element:Hashable{
    func isSubset<S:Sequence>(of other:S) -> Bool
    where S.Element == Element{
        let  otherSet = Set(other)
        for element in self {
            guard otherSet.contains(element) else{
                return false
            }
        }
        return true
    }
}

// 使用闭包对行为进行参数优化
let isEven = {$0 % 2 == 0}
print((0..<5).contains(where: isEven))

extension Sequence{
    func isSubset<S:Sequence>(of other:S,
      by areEquivalent:(Element,S.Element)->Bool) -> Bool{
        for element in self {
            guard other.contains(where: {areEquivalent(element,$0)})else{
                return false
            }
        }
        return true
    }
}

// 二分查找法
extension Array {
    func binarySearch(for value:Element,
        areInIncreaseingOrder:(Element,Element)->Bool)
        -> Int? {
            var left  = 0
            var right = count - 1
            while left <= right {
                let mid = (left + right) / 2
                let candidate = self[mid]
                if areInIncreaseingOrder(candidate,value){
                    left = mid + 1
                }else if areInIncreaseingOrder(value,candidate){
                    right = mid - 1
                }else{
                    return mid
                }
            }
            return nil
    }

}

extension Array where Element:Comparable{
    func binarySearch(for value:Element) -> Int? {
        return self.binarySearch(for: value,areInIncreaseingOrder: <)
    }
}

// 泛型二分查找
extension RandomAccessCollection{
    func binarySearch(for value:Element,
                      areInIncreaseingOrder:(Element,Element)->Bool)
        -> Index? {
            guard isEmpty else {
                return nil
            }
            var left  = startIndex
            var right = index(before: endIndex)
            while left <= right {
                let dist = distance(from: left, to: right)
                let mid = index(left, offsetBy: dist/2)
                let candidate = self[mid]
                if areInIncreaseingOrder(candidate,value){
                    left = index(after: mid)
                }else if areInIncreaseingOrder(value,candidate){
                    right = index(before: mid)
                }else{
                    return mid
                }
            }
            return nil
    }

}

extension RandomAccessCollection where Element:Comparable{
    func binarySearch(for value:Element) -> Index? {
        return binarySearch(for: value,areInIncreaseingOrder: <)
    }
}
