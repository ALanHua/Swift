//
//  main.swift
//  64_NSNull
//
//  Created by yhp on 2017/11/23.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let jsonValue:AnyObject = NSNull()
if let string = jsonValue as? String {
    print(string.hasPrefix("a"))
}else{
    print("不能解析")
}

