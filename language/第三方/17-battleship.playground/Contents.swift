//: Playground - noun: a place where people can play

import UIKit

typealias Distance = Double
// position
struct Position{
    var x : Double
    var y : Double
}

extension Position{
    func inRange(range: Distance) -> Bool {
        return sqrt(x*x + y*y) <= range
    }
}
extension Position{
    func minus(p:Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    var length: Double{
        return sqrt(x * x + y * y)
    }
}

// Ship
struct Ship{
    var position: Position
    var firingRange: Distance
    var unsafedRange: Distance
}

extension Ship{
    func canEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange && targetDistance > unsafedRange
    }
}

extension Ship{
    func canSafelyEngageShip(target:Ship,friendly:Ship) -> Bool {
        let targetDistance = target.position.minus(p: position).length
        let friendlyDistance = friendly.position.minus(p: position).length
        return targetDistance <= firingRange
            && targetDistance > unsafedRange
            && (friendlyDistance > unsafedRange)
    }
}

typealias Region = (Position) -> Bool

func circle(redius: Distance) -> Region{
    return {point in point.length <= redius}
}

func circle2(redius: Distance,center:Position) -> Region{
    return {point in point.minus(p: center).length <= redius}
}

//let point = Position(x: 10, y: 3)
//circle(redius: 10)(point)

/*
 @escaping Closure 逃逸闭包
 If a closure is passed as an argument to a function and it is invoked after the function returns, the closure is escaping.
 */
func shift(region:@escaping Region,offset:Position) ->Region{
    return {point in region(point.minus(p: offset))}
}

// 一个圆心为（5，5） 半径为10 的圆
shift(region: circle(redius: 10), offset: Position(x: 5, y: 5))


func invert(region:@escaping Region)->Region{
    return {point in !region(point)}
}

func intersection(region1:@escaping Region,_ region2:@escaping Region) ->Region
{
    return {point in region1(point) && region2(point)}
}

func union(region1:@escaping Region,_ region2:@escaping Region) ->Region{
    return {point in region1(point) || region2(point)}
}

func difference(region:@escaping Region,minus:@escaping Region)->Region{
    return intersection(region1: region, invert(region: minus))
}

extension Ship{
    func canSafelyEngage(target:Ship,friendly:Ship) -> Bool {
        let rangeRange = difference(region: circle(redius: 10), minus: circle(redius: unsafedRange))
        let firingRange = shift(region: rangeRange, offset: position)
        let friendlyRange = shift(region: circle(redius: unsafedRange), offset: friendly.position)
        let resultRange = difference(region: firingRange, minus: friendlyRange)
        return resultRange(target.position)
    }
}
// 上面这一部分暂时还没看懂



