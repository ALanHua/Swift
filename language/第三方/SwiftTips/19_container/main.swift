//
//  main.swift
//  19_container
//
//  Created by yhp on 2017/11/7.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let mixed:[Any] = [1,"two",1]
print(mixed)
let objectArray = [1 as NSObject,"two" as NSObject,3 as NSObject]
print(objectArray)

let mixed1:[CustomStringConvertible] = [1,"two",3]

for obj in mixed1 {
    print(obj.description)
}

print("-----------")

enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}

let mixed2 = [IntOrString.IntValue(1),
              IntOrString.StringValue("two"),
              IntOrString.IntValue(2)]
for value in mixed2 {
    switch value {
    case let .IntValue(i):
        print(i * 2)
    case let .StringValue(s):
        print(s.capitalized)
    }
}






