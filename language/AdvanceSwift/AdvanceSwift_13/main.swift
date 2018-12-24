//
//  main.swift
//  AdvanceSwift_13
//
//  Created by yhp on 2018/12/21.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

// 1,object Members
class Manny {
    let name = "manny"
    func sayName() {
        print(name)
    }
    
    class Klass {
    }
}
// 2, self
class Dog {
    var name = ""
    var whatADogSays = "woof"
    
    func bark() {
        print(self.whatADogSays)
    }
    
    func speak()  {
        self.bark()
    }
}

let dog1 = Dog()
dog1.whatADogSays = "meow"
dog1.bark()

// 3,function
@discardableResult // 消除单独调用sum时产生的警告
func sum(_ x:Int,_ y:Int) -> Int {
    let result = x + y
    return result
}

print(sum(4, 5))
sum(5, 6)
