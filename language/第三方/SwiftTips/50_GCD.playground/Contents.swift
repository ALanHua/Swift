//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// 创建目标队列
let workingQueue = DispatchQueue(label: "my_queue")

workingQueue.async {
    print("努力工作")
    Thread.sleep(forTimeInterval: 2)
    DispatchQueue.main.async {
        print("结束工作，更新UI")
    }
}

let time:TimeInterval = 2.0
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
    print("2 秒后输出 333")
}

typealias  Task = (_ cancel:Bool) -> Void

func delay(_ time: TimeInterval,task:@escaping () ->()) -> Task?{
    func dispatch_later(block:@escaping ()->()){
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure:(() -> Void)? = task
    var result:Task?
    
    let delayClosure:Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayClosure
    
    dispatch_later {
        if let  delayClosure = result{
            delayClosure(false)
        }
    }
    return result
}

func cancel(_ task:Task?){
    task?(false)
}

delay(2) {
    print("2 秒后输出 ----")
}
let task = delay(5) {
     print("拨打110")
}
cancel(task)










