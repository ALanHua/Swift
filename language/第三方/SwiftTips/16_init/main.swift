//
//  main.swift
//  16_init
//
//  Created by yhp on 2017/11/6.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class Cat {
    var name: String
    init() {
        name = "cat"
    }
}
class Tiger: Cat {
    let power :Int
    override init() {
        power = 10
//        super.init()
//        name = "tiger"
    }
}

class ClassA {
    let numA: Int
    required init(num:Int) {
        numA = num
    }
    
    convenience init(bigNum:Bool) {
        self.init(num: bigNum ? 10_000 : 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    
    required init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
}
let anObj = ClassB(bigNum: true)
print(anObj.numA,anObj.numB)
