//
//  main.swift
//  23_range
//
//  Created by yhp on 2017/11/8.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

for i in 0...3{
    print(i,terminator:"")
}
print(" ")
let test = "helLo"
let interval = "a"..."z"
for c in test {
    if !interval.contains(String(c)){
        print("\(c) 不是小写字母")
    }
}

