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
// 4,void 返回值的3种形式
func say1(_ s: String) -> Void {
    print(s)
}
func say2(_ s: String) -> () {
    print(s)
}

func say3(_ s: String) {
    print(s)
}

say1("123")
say2("123")
say3("123")

// 5,function Signature
func echoString(_ s:String,times:Int) -> String {
    var result = ""
    
    for _ in 1...times {
        result += s
    }
    return result
}

print(echoString("hi", times: 3))

func echo(string s: String,times n : Int) -> String {
    var result = ""
    for _ in 1...n {
        result += s
    }
    return result
}

print(echo(string:"hi", times: 3))

// overloading
func say() -> String {
    return "one"
}

func say() -> Int {
    return 1
}

// Default Parameter Values
class Dog2 {
    func say(_ s: String,times:Int = 1) {
        for _ in 1...times {
            print(s)
        }
    }
}
let d2 = Dog2()
d2.say("woof")
d2.say("woof", times: 3)

// Variadic Parameters 可变参数
func sayStrings(_ arrayOfStrings:String ...) {
    for s in  arrayOfStrings{
        print(s)
    }
}

sayStrings("hey","ho","nonny nonny no")
sayStrings("Mnanny")

// print 函数
print("Andt",3,true)
print("Manny","Moe",separator:":",terminator:",")
print("jack")

// Ignored Parameters
func say(_ s:String,times:Int,loudly _ :Bool) {
    
}
say("hi", times: 3, loudly: true)

func say(_ s:String,times:Int,_ :Bool) {
    // 这样的话 loudly就不需要加了
}
say("hi", times: 3, true)

// Modifiable Parameters 默认这些形参都是let ，不能被修改
func say2(_ s:String,times:Int,loudly :Bool) {
    // 如果需要修改形参的话只能如下定义一个可变的参数
    var loudly = loudly
    loudly = true
    print(loudly)
}

func removeCharacter(_ c: Character,from s : String) -> Int {
    var s = s
    var howMany = 0
    while let ix = s.firstIndex(of: c) {
        s.remove(at: ix)
        howMany += 1
    }
    return howMany
}
let s = "hello"
print(removeCharacter("l", from: s))
// 如果想要修改形参的值，必须在形参前面i加一个inout
func removeCharacter(_ c: Character,from s : inout String) -> Int {
    var howMany = 0
    while let ix = s.firstIndex(of: c) {
        s.remove(at: ix)
        howMany += 1
    }
    return howMany
}
var s2 = s
print(removeCharacter("l", from: &s2))
print(s2)
// UnsafeMutablePointer

// Function in Function


