//
//  main.swift
//  02_protocol_mutating
//
//  Created by yhp on 2017/10/25.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation



/// mutating修饰的方法可以修改struct和enum中变量的值

protocol Vehicle {
    var numberOfWheels:Int{get}
    var color: CGColor {get set}
    mutating func changeColor()
}

struct MyCar:Vehicle {
    let numberOfWheels = 4
    var color = CGColor.black
    mutating func changeColor() {
        color = .white
    }
}
