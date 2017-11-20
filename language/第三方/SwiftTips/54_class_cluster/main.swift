//
//  main.swift
//  54_class_cluster
//
//  Created by yhp on 2017/11/20.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class Dringking {
    typealias LiquidColor = CGColor
    var color:LiquidColor {
        return .clear
    }
    class func drinking(name:String) -> Dringking {
        var drinking : Dringking
        switch name {
        case "Coke":
            drinking = Coke()
        case "Beer":
            drinking = Beer()
        default:
            drinking = Dringking()
        }
        return drinking
    }
}

class Coke: Dringking {
    override var color: LiquidColor{
        return .black
    }
}
class Beer: Dringking{
    override var color: LiquidColor {
        return .white
    }
}

let coke = Dringking.drinking(name: "Coke")
print(NSStringFromClass(type(of:coke)))
let beer = Dringking.drinking(name: "Beer")
print(NSStringFromClass(type(of:beer)))




