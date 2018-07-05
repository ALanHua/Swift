//
//  main.swift
//  70_Codable
//
//  Created by yhp on 2018/7/5.
//  Copyright © 2018年 YouHuaPei. All rights reserved.
//

import Foundation

let jsonString =
"""
{
    "name": "小明",
    "age": 12,
    "weight": 43.2
}
"""
//  swift 4 默认为我们实现该协议
struct Student : Decodable {
    var name : String
    var age  : Int
    var weight : Float
}
// amazing
do {
    let xiaoming = try JSONDecoder().decode(Student.self, from: jsonString.data(using: .utf8)!)
    print(xiaoming)
}catch {
    print("解析不了")
}





