//
//  main.swift
//  AdvanceSwift_11
//
//  Created by yhp on 2018/11/14.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

// 协议
protocol Drawing {
    mutating func addEllipse(rect:CGRect,fill:CGColor)
    mutating func addRectangle(rect:CGRect,fill:CGColor)
//    实现动态派发
    mutating func addCircle(center:CGPoint,radius:CGFloat,fill fillColor:CGColor)
}

extension CGContext:Drawing{
    func addEllipse(rect: CGRect, fill: CGColor) {
        setFillColor(fill)
        fillEllipse(in: rect)
    }
    
    func addRectangle(rect: CGRect, fill fillColor: CGColor) {
        setFillColor(fillColor)
        fill(rect)
    }
}

// 协议扩展
extension Drawing{
//    静态派发
    mutating func addCircle(center:CGPoint,radius:CGFloat,fill fillColor:CGColor){
        let diameter = radius * 2
        let origin = CGPoint(x: center.x - radius , y: center.y - radius)
        let size = CGSize(width: diameter, height: diameter)
        let rect = CGRect(origin: origin, size: size)
        
        addEllipse(rect: rect, fill: fillColor)
        
    }
}
// 协议扩展中重新方法

struct ConstantIterator:IteratorProtocol {
    typealias Element = Int
    mutating func next() -> Int?{
        return 1
    }
}

// 带有Self的协议
func f<C:CustomStringConvertible>(_ x:C) -> Int {
    return MemoryLayout.size(ofValue: x)
}
func g(_ x:CustomStringConvertible) -> Int {
    return MemoryLayout.size(ofValue: x)
}
print(f(5))
print(g(5))

// 互用性
/***
 UnsafeMutableRawBufferPointer
 含有managed的类型代表内存是自动管理的,编译器将负责为你申请和是否内存
 含unsafe类型不提供内存管理
 含有buffer类型表示作用于一连串的多个元素
 raw类型包含无类型的原始数据等同于void*
 mutable类型允许它指向的内存发生改变
 
 指针
 UnsafePointer是最基础的指针类型 --- const指针类似
    UnsafePointer<Int> --- const int*
 
 */
var x = 5
func fetch(p:UnsafePointer<Int>) ->Int {
    return p.pointee
}

print(fetch(p: &x))

func increent(p:UnsafeMutablePointer<Int>){
    p.pointee += 1
}
increent(p: &x)
print(x)

// 手动申请内存
let z = UnsafeMutablePointer<Int>.allocate(capacity: 2)
z.initialize(repeating: 42, count: 2)
print(z.pointee)
(z+1).pointee = 43
print(z[1])
z.deallocate()
