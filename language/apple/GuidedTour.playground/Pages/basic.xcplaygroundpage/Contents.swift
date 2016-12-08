//: [Previous](@previous)

import UIKit

/// 基本运算符省略

///  元组进行比较
(1,"zebra") < (2,"apple")
(3,"apple") < (3,"bird")
(4,"dog") < (4,"dog")
/// 三元条件
let contentHeight = 40
let hasHeader = true
let rowhegiht = contentHeight + (hasHeader ? 50 :20)

///Nil-Coalescing Operator
/*
 a ?? b
 ---> a!= nil ? a! : b
 */
let defaultColorName = "red"
var userDefaultColorName: String?
var colorNameToUse = userDefaultColorName ?? defaultColorName

// Closed Range Operator
/*
 ----(a...b)
 ----(a..<b)
 */
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// Logical Operators
/*
 ----- !
 ----- &&
 ----- ||
 */
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
}else {
    print("ACCESS DENIED")
}

let hasDoorKey = false
let knowsDverridePassword = true
if hasDoorKey || knowsDverridePassword {
    print("Welcome")
}else{
    print("ACCESS DENIED")
}

if (enteredDoorCode && passedRetinaScan)
    || hasDoorKey
    || knowsDverridePassword {
    print("Welcome")
}else{
    print("ACCESS DENIED")
}

// Strings and Characters
/*
 String Literals
 String Mutability
 */
let someString = "Some string literal value"
var emptyString = ""
var anotherEmptyString = String();
if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += "and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander" // compile error

for character in "Dog!🐶".characters{
    print(character)
}

let exclamationMark : Character = "!"
let catCharcters : [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharcters)
print(catString)




