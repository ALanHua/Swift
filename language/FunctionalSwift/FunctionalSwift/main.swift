//
//  main.swift
//  FunctionalSwift
//
//  Created by yhp on 2018/8/9.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// 定义两种类型

typealias Distance = Double
struct Position {
    var x: Double
    var y: Double
}

extension Position {
    
    /// 判断一个点是否在圆里
    /// - Parameter range: 距离
    /// - Returns: Bool
    func inRange(range: Distance) -> Bool {
        return sqrt(x*x + y*y) <= range
    }
}

extension Position {
    func minus(p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    var length: Double {
        return sqrt(x * x + y * y)
    }
}

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    
    /// 判断是否可以交战
    /// - Parameter target: 目标
    /// - Returns: Bool
    func canEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        return targetDistance <= firingRange
    }
    
    /// 判读是否处于安全距离
    /// - Parameter target: 目标
    /// - Returns: Bool
    func canSafelyEngageShip(target:Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        return targetDistance <= firingRange &&
            targetDistance > unsafeRange
    }
    
    
    /// 避免敌方过于接近友方船舶
    /// - Parameters:
    ///   - target: 敌方目标
    ///   - friendly: 友方目标
    /// - Returns: Bool
    func canSafelyEngageShip1(target:Ship,friendly:Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx*dx + dy*dy)
        let friendlyDx =  friendly.position.x - target.position.x
        let friendlyDy =  friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx*friendlyDx + friendlyDy*friendlyDy)
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && friendlyDistance > unsafeRange
    }
    
    // MARK:优化
    func canSafelyEngageShip2(target:Ship,friendly:Ship) -> Bool {
        let targetDistance = target.position.minus(p: position).length
        let friendlyDistance = friendly.position.minus(p: position).length
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && friendlyDistance > unsafeRange
    }
    
}





















