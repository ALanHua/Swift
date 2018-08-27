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

extension CGSize {
//    func fit(vector:CGVector,_ rect:CGRect) -> CGRect {
//        let scaleSize = CGSize(width: rect.width / self.width, height: rect.height / self.height)
//        let scale = min(scaleSize.width, scaleSize.height)
//        let size = CGSize(width: self.width * scale, height: self.height * scale)
//        let space = vector.s
//        
//    }
}



