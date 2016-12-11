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
// concaternating string and character
let string1 = "hello world"
let string2 = " there"
var welcome = string1 + string2
var instruction = "look over"
instruction += string2
welcome.append(exclamationMark)
// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// Unicode
/*
 字符串中的特殊字符
 -----\0: 空字符
 -----\\: 反斜杠
 -----\t: 水平制表符
 -----\n: 换行
 -----\r: 回车
 -----\": 双引号
 -----\‘: 单引号
 -----\{N}: 进制
 */
let wiseWords = "\" Imagination is more important than knowledge\"  - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let eAcute: Character = "\u{E9}"
let combineEacute: Character = "\u{65}\u{301}"
// Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusalMenagerie has \(unusualMenagerie.characters.count) characters")
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")
//Accessing and Modifying a String
let greeting = "Guten Tag!"
greeting.endIndex
greeting.startIndex
greeting.characters.count
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// 遍历字符串已字符输出
for index in greeting.characters.indices {
    print("\(greeting[index])",terminator:" ")
}
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " swift".characters, at: welcome.index(before: welcome.endIndex))
// 移除数据
welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
welcome


