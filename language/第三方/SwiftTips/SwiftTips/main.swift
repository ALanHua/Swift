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
