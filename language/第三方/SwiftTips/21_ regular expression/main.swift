//
//  main.swift
//  21_ regular expression
//
//  Created by yhp on 2017/11/8.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

struct RegexHelper {
    let regex:NSRegularExpression
    init(_ pattern:String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    func match(_ input:String) -> Bool {
        let matches = regex.matches(in: input, options: [], range:NSMakeRange(0, input.utf16.count))
//        print("count:\(matches.count)")
        return matches.count > 0
    }
}

// 正则表达式学习地址：
// http://deerchao.net/tutorials/regex/regex.htm


let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
let matcher:RegexHelper
do{
    matcher = try RegexHelper(mailPattern)
}
let mybeMailAddress = "onev@onevcat.com"

if matcher.match(mybeMailAddress) {
    print("有效邮箱地址")
}
precedencegroup MAchPrecedence{
    associativity:none
    higherThan:DefaultPrecedence
}
infix operator =~: MAchPrecedence

func =~(lhs:String,rhs:String) ->Bool{
    do {
        return try RegexHelper(rhs).match(lhs)
    } catch _ {
        return false
    }
}

if "onev@onevcat.com" =~
    "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$" {
    print("有效的邮箱地址")
}else{
     print("无效邮箱地址2")
}





