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
// 类似于c语言的函数指针
typealias Region = (Position) -> Bool

func circle(radius:Distance) -> Region {
    return {point in point.length <= radius}
}
// 闭包简写
func circle_(radius:Distance) -> Region {
    return {$0.length <= radius}
}

func circle(radius:Distance,center:Position) -> Region {
    return {
        point in point.minus(p: center).length <= radius
    }
}


/// 移动区域想右上方移动
/// - Parameters:
///   - region: 区域
///   - offset: 位置偏移
/// - Returns: 区域
func shift(region:@escaping Region,offset:Position) -> Region {
    return {
        point in region(point.minus(p: offset))
    }
}

/// 相当烧脑筋
let a = shift(region: circle(radius: 10), offset: Position(x: 5, y: 5))
print(a(Position(x: 12, y: 12)))

func invert(region:@escaping Region) -> Region {
    return {
        point in !region(point)
    }
}

let b = invert(region: circle(radius: 10))
print(b(Position(x: 5, y: 5)))

// MARK: 交集
func intersection(region1:@escaping Region,_ region2:@escaping Region) -> Region {
    return {
        point in region1(point) && region2(point)
    }
}

let c = intersection(region1: circle(radius: 10), circle(radius: 5))
print(c(Position(x: 7, y: 7)))

// MARK: 并集
func union(region1:@escaping Region,_ region2:@escaping Region) -> Region {
    return {
        point in region1(point) || region2(point)
    }
}

let d = union(region1: circle(radius: 10), circle(radius: 5))
print(d(Position(x: 7, y: 7)))

func difference(region:@escaping Region,minus: @escaping Region) -> Region {
    return intersection(region1: region, invert(region: minus))
}

let e = difference(region: circle(radius: 10), minus: circle(radius: 5))
print(e(Position(x: 7, y: 7)))


extension Ship {
    // MARK:代码这样一写马上你就晕啦 下面的代码已经将问题抽象化啦，目前暂时还有有点晕
    func canSafelyEngageShip3(target:Ship,friendly:Ship) -> Bool {
        //  MARK: 计算是不是在两个区域的差集 在firingRange里 不在 unsafeRange
        let rangeRegion = difference(region: circle(radius: firingRange), minus: circle(radius: unsafeRange))
        // 向右上方移动position位置
        let firingRegion = shift(region: rangeRegion, offset: position)
        let friendlyRegion = shift(region: circle(radius: unsafeRange), offset: friendly.position)
        //  在开火区域，但地方不在友方不在非安全区域
        let resulrRegion = difference(region: firingRegion, minus: friendlyRegion)
        return resulrRegion(target.position)
    }
}




