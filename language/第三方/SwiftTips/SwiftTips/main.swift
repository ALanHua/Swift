//
//  main.swift
//  SwiftTips
//
//  Created by yhp on 2017/10/25.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

// Tip 1 currying
func addTo(_ adder:Int) -> (Int) ->Int {
    return {
        num in
        return num + adder
    }
}

let addTwo = addTo(2)
let result = addTwo(6)
print(result)

func greaterThan(_ comparer:Int) -> (Int)->Bool {
    return {$0 > comparer}
//    return {
//        num in
//        return num > comparer
//    }
}
let greaterThan10 = greaterThan(10)
print(greaterThan10(13))
print(greaterThan10(9))

protocol TargetAction {
    func performAction()
}
struct TargetActionWrapper<T:AnyObject> :TargetAction{
    weak var target:T?
    let action:(T) -> ()->()
    func performAction() {
        if let t = target {
            action(t)()
        }
    }
}
enum ControlEvent {
    case TouchUpside
    case ValueChanged
//    ...
}
class Control {
    var actions = [ControlEvent:TargetAction]()
    func setTarget<T:AnyObject>(target:T,action:@escaping (T) -> () -> (),controlEvent:ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    func removeTargetForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent] = nil
    }
    func performActionForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}


