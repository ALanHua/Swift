//
//  main.swift
//  33_optional
//
//  Created by yhp on 2017/11/12.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

//var maybeObject : MyClass!
var string:String? = "string"
var anotherString: String?? = string
//print(anotherString)
var  aNil:String? = nil
var anotherNil:String?? = aNil
var literalNil:String?? = nil

// po 命令可以打印optional的值
// fr v - R 可以打印出变量未加工过时的信息
if anotherNil != nil {
    print("anotherNil")
}
if literalNil != nil {
   print("literalNil")
}

let num: Int? = 3
let result = num.map {
    $0 * 2
}
print(result!)





