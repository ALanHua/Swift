//
//  main.swift
//  66_overflow
//
//  Created by yhp on 2017/11/23.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

var max = Int.max
print(max)
max = max &+ 1
print(max)

