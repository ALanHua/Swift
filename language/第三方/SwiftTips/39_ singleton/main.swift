//
//  main.swift
//  39_ singleton
//
//  Created by yhp on 2017/11/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

// 最优
class MyManger {
    static let shared = MyManger()
    private init(){}
}
