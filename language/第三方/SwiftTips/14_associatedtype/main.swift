//
//  main.swift
//  14_associatedtype
//
//  Created by yhp on 2017/11/6.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

protocol Food {
}

protocol Animal {
    associatedtype F:Food
    func eat(_ food: F)
}

struct Meat:Food {
}
struct Grass:Food {
}

struct Tiger:Animal {
//    typealias F = Meat
    func eat(_ food: Meat) {
        print("eat \(food)")
    }
    
}
struct Sheep:Animal {
    func eat(_ food:Grass) {
        print("eat \(food)")
    }
}

let meat = Meat()
let tiger = Tiger()
tiger.eat(meat)

func isDangerous<T:Animal>(animal:T) -> Bool {
    if animal is Tiger {
        return true
    }else {
        return false
    }
}
print(isDangerous(animal: Tiger()))
print(isDangerous(animal: Sheep()))






