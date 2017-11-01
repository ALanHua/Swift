//
//  main.swift
//  07_optional chaining
//
//  Created by yhp on 2017/10/31.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class Toy {
    let name :String
    init(name:String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child{
    var pet:Pet?
}
extension Toy{
    func play(){
        print("play")
    }
}
let xiaoming = Child()
let toyName = xiaoming.pet?.toy?.name

let playClousure = {
    (child:Child) -> ()? in
    child.pet?.toy?.play()
}

if let result:() = playClousure(xiaoming) {
    print(result)
    print("好开心")
}else{
    print("没有玩具可以玩")
}



