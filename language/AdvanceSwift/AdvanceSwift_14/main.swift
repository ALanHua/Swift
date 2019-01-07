//
//  main.swift
//  AdvanceSwift_14
//
//  Created by yhp on 2019/1/7.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

// Variable Scope and Lifetime
// Global variables
let globalVariable = "global"
class Dog {
    func printGlobal() {
        print(globalVariable)
    }
}
// Properties
class Dog2 {
    static let staticProperty = "staticProperty"
    let instanceProperty = "instanceProperty"
    func printInstanceProperty() {
         print(self.instanceProperty)
    }
    // Local variables
    func printLocalVariable() {
        let localVariable = "local"
        print(localVariable)
    }
}

class Cat {
    func printDogStaticProperty() {
        print(Dog2.staticProperty)
    }
    func printDogInstanceProperty() {
        let d = Dog2()
        print(d.instanceProperty)
    }
}

