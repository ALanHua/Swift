//
//  main.swift
//  02_protocol_mutating
//
//  Created by yhp on 2017/10/25.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

protocol Vehicle {
    var numberOfWheels:Int{get}
    var color: UIColor {get set}
    mutating func changeColor()
}

