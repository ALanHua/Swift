//
//  main.swift
//  70_Codable
//
//  Created by yhp on 2018/7/5.
//  Copyright © 2018年 YouHuaPei. All rights reserved.
//

import Foundation

let jsonString2 =
"""
{
    "name": "小明",
    "age": 12,
    "weight": 43.2
    "school": {
        "name": "市第一中学",
        "address": "XX市人民中路 66 号"
    }
    "birth_date": "1992-12-25"
}
"""
let jsonString =
"""
{
    "name": "小明",
    "age": 12,
    "weight": 43.2
    "birth_date": "1992-12-25"
}
"""

struct School:Decodable {
    var name : String
    var address : String
}

//  swift 4 默认为我们实现该协议
struct Student : Decodable {
    var name: String
    var age: Int
    var weight: Float
    var birthday: Date?
    enum CodingKeys: String,CodingKey {
        case name
        case age
        case weight
        case birthday = "birth_date"
    }
    /*
     Bool 类型只支持true/false jason 无法解析
     */
//    var isYoungPioner : Bool
    
}









