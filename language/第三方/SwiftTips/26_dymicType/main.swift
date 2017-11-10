//
//  main.swift
//  26_dymicType
//
//  Created by yhp on 2017/11/10.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class Pet {
}

class Cat: Pet {
}

class Dog: Pet {
}

func printPet(_ pet:Pet) {
    print("Pet")
}

func printPet(_ cat:Cat){
    print("Meow")
}

func printPet(_ dog:Dog){
    print("Bark")
}
printPet(Cat())
printPet(Dog())
printPet(Pet())
print("-------------")

/// swift 默认不支持动态派发
func printThem(_ pet:Pet,_ cat: Cat) {
    if let aCat = pet as? Cat {
        printPet(aCat)
    }else if let aDog = pet as? Dog {
         printPet(aDog)
    }
    printPet(cat)
}

printThem(Dog(),Cat())

