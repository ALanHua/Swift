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
extension CGRectEdge{
    var isHirizontal:Bool {
        return self == .maxXEdge || self == .minXEdge
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

extension CGRect {
    func sqlit(radio:CGFloat,edge:CGRectEdge) -> (CGRect,CGRect) {
        let length = edge.isHirizontal ? width : height
        return divided(atDistance:length, from: edge)
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
        case .Prim(let size, .Text(let text)):
            let frame = size.fit(vector: CGVector(dx: 0.5, dy: 0.5), bounds)
            let font = NSFont.systemFont(ofSize: 12)
            let attributes = [NSAttributedStringKey.font:font]
            let attributedText = NSAttributedString(string: text, attributes: attributes)
            attributedText.draw(in: frame)
        case .Beside(let left,let right):
            let (lFrame,rFrame) = bounds.sqlit(radio: left.size.width / diagram.size.width, edge: .minXEdge)
            draw(bounds: lFrame, left)
            draw(bounds: rFrame, right)
        case .Below(let top,let bottom):
            let (lFrame,rFrame) = bounds.sqlit(radio: bottom.size.width / diagram.size.width, edge: .minXEdge)
            draw(bounds: lFrame, top)
            draw(bounds: rFrame, bottom)
        case .Attributed(.FillColor(let color),let d):
            saveGState()
            color.set()
            draw(bounds: bounds, d)
            restoreGState()
        case .Align(let vec, let diagram):
            let frame = diagram.size.fit(vector: vec, bounds)
            draw(bounds: frame, diagram)
        }
    }
}

extension Diagram {
    func pdf(width:CGFloat) -> Data {
        let height = width * (size.height / size.width)
        let v = Draw(frame: NSRect(x: 0, y: 0, width: width, height: height), diagram: self)
        return v.dataWithPDF(inside: v.bounds)
    }
}

class Draw: NSView {
    let diagram : Diagram
    
    init(frame frameRect: NSRect,diagram : Diagram) {
        self.diagram = diagram
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("NSCoding not support")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        guard let context = NSGraphicsContext.current else {
            return
        }
        context.cgContext.draw(bounds: self.bounds, diagram)
    }
}

func rect(width: CGFloat,height: CGFloat) -> Diagram {
    return .Prim(CGSize(width: width, height: height), .Rectangle)
}

precedencegroup QuesGroup {
    associativity: left
}

infix operator ||| : QuesGroup

func |||(l:Diagram,r:Diagram) -> Diagram {
    return Diagram.Beside(l, r)
}

infix operator --- : QuesGroup
func ---(l:Diagram,r:Diagram) -> Diagram {
    return Diagram.Below(l, r)
}

extension Diagram {
    func fill(color:NSColor) -> Diagram {
        return .Attributed(.FillColor(color), self)
    }
    
    func alignTop() -> Diagram {
        return .Align(CGVector(dx: 0.5, dy: 1), self)
    }
    
    func alignBottom() -> Diagram {
        return .Align(CGVector(dx: 0.5, dy: 0), self)
    }
    
}
let empty:Diagram = rect(width: 0, height: 0)
func hcat(diagrams:[Diagram]) -> Diagram {
    return diagrams.reduce(empty, { $0 ||| $1})
}


