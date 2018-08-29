//
//  main.swift
//  FunctionalSwift_07
//
//  Created by yhp on 2018/8/27.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation
import AppKit
import CoreGraphics

enum Attribute{
    case FillColor(NSColor)
}
enum Primitive {
    case Ellipse
    case Rectangle
    case Text(String)
}

indirect enum Diagram {
    case Prim(CGSize,Primitive)
    case Beside(Diagram,Diagram)
    case Below(Diagram,Diagram)
    case Attributed(Attribute,Diagram)
    case Align(CGVector,Diagram)
}

extension Diagram {
    var size: CGSize {
        switch self {
        case .Prim(let size, _):
            return size
        case .Attributed(_, let x):
            return x.size
        case .Beside(let l, let r):
            let sizeL = l.size
            let sizeR = r.size
            return CGSize(width: sizeL.width + sizeR.width, height: sizeL.height + sizeR.height)
        case .Below(let l, let r):
            return CGSize(width: max(l.size.width, r.size.width), height: l.size.height + r.size.height)
        case .Align(_, let r):
            return r.size
        }
    }
}

func *(l:CGFloat,r:CGSize) -> CGSize {
    return CGSize(width: l * r.width, height: l * r.height)
}
func *(l:CGSize,r:CGSize) -> CGSize {
    return CGSize(width: l.width * r.width, height: l.height * r.height)
}

func /(l:CGSize,r:CGSize) -> CGSize {
    return CGSize(width:  l.width / r.width, height: l.height / r.height)
}

func -(l:CGSize,r:CGSize) -> CGSize {
    return CGSize(width: l.width - r.width, height: l.height - r.height)
}

func -(l:CGPoint,r:CGPoint) -> CGPoint {
    return CGPoint(x: l.x - r.x, y: l.y - r.y)
}

extension CGVector {
    var point:CGPoint{return CGPoint(x: dx, y: dy)}
    var size:CGSize {return CGSize(width: dx, height: dy)}
}

extension CGSize {
    var point:CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
}

extension CGSize {
    func fit(vector:CGVector,_ rect:CGRect) -> CGRect {
        let scaleSize = rect.size / self
        let scale = min(scaleSize.width, scaleSize.height)
        let size = scale * self
        let space = vector.size * (size - rect.size)
        return CGRect(origin: rect.origin - space.point, size: size)
    }
}

let rect = CGSize(width: 1, height: 1).fit(vector: CGVector(dx: 0.5, dy: 0.5), CGRect(x: 0, y: 0, width: 200, height: 100))

print(rect)

extension CGContext {
    func draw(bounds:CGRect,_ diagram:Diagram) {
        switch diagram {
        case .Prim(let size, .Ellipse):
            let frame = size.fit(vector: CGVector(dx: 0.5, dy: 0.5), bounds)
            fillEllipse(in: frame)
        case .Prim(let size, .Rectangle):
            let frame = size.fit(vector: CGVector(dx: 0.5, dy: 0.5), bounds)
            fill(frame)
        case .Prim(_, .Text(_)):
            break
        case .Beside(_, _):
            break
        case .Below(_, _):
            break
        case .Attributed(_, _):
            break
        case .Align(_, _):
            break
        }
    }
}



