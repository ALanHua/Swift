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

