//
//  main.swift
//  49_COpaquePointer
//
//  Created by yhp on 2017/11/19.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let callBack:@convention(c) (Int32,Int32) -> Int32 = {
    (x,y) -> Int32 in
    return x + y
}

let result = callBack(1,2)
print(result)

