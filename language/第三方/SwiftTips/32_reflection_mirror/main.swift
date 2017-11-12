//
//  main.swift
//  32_reflection_mirror
//
//  Created by yhp on 2017/11/12.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let age :Int
}

let xiaoMing = Person(name: "XiaoMing", age: 16)
let r = Mirror(reflecting: xiaoMing)
print("属性个数:\(r.children.count)")
for child in r.children {
    print("属性名:\(String(describing: child.label))，值:\(child.value)")
}
print("---------")
dump(xiaoMing)


func valueFrom(_ object:Any,key:String) -> Any? {
    let mirror = Mirror(reflecting: object)
    for child in mirror.children {
        let (targetKey,targetMirror) = (child.label,child.value)
        if key == targetKey {
            return targetMirror
        }
    }
    return nil
}

if let name = valueFrom(xiaoMing, key: "name") as? String {
    print("through key get \(name)")
}



