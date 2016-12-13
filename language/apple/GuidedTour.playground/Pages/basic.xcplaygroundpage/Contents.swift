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
//Comparing Strings
/*
 字符串比较不匹配语言环境
 */
let quotation = "We're a lot alike, you and I."
let sameQuotaton = "We're a lot alike, you and I."
if quotation == sameQuotaton {
    print("These two string are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }else if scene.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    }else if scene.hasSuffix("Friar Lawrence's cell"){
        cellCount += 1
    }
}
print("There are \(act1SceneCount) scene in Act 1 \(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Unicode
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ",terminator:" ")
}
print("\n")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ",terminator:" ")
}
print("\n")
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
    print("\(scalar) ")
}

// 集合类型
/// 数组
var someInts = [Int]()
someInts.count
someInts.append(3)
someInts = []

var threeDouble = Array(repeatElement(0.0, count: 3))
var anotherThreeDouble = Array(repeatElement(2.5, count: 3))
var sixDoubles = threeDouble + anotherThreeDouble

var shoppingList : [String] = ["Eggs","Milk"]
///ar shoppingList = ["Eggs","Milk"]
shoppingList.count
if shoppingList.isEmpty {
    print("The shpping list is empty")
}else {
    print("The shooping list is not empty")
}
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList[1...2] = ["apple","banana"]
shoppingList.insert("Aaple syrup", at: 0)
shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()

for item in shoppingList {
    print(item)
}
/// 迭代
for (index,value) in shoppingList.enumerated(){
    print("Item \(index + 1):\(value)")
}
/// 集合
var letters = Set<Character>()
letters.count
letters.insert("a")
letters.insert("b")
letters = []
var favouriteGenres : Set<String> = ["Rock", "Classical", "Hip hop"]
favouriteGenres.count
if favouriteGenres.isEmpty {
    print("As far as music goes,I'm not picky")
}else {
    print("I have particular music preferences.")
}
favouriteGenres.insert("Jazz")
/// 可能没有
if let removedGenre = favouriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
}else {
    print("I never much cared for that.")
}

if favouriteGenres.contains("Funk") {
    print("I get up on the good foot.")
}else {
    print("It's too funky in here.")
}
/// 遍历
for genre in favouriteGenres.sorted() {
    print("\(genre)")
}
/// 集合运算
let oddDigits : Set = [1,3,5,7,9]
let evenDigits : Set = [0,2,4,6,8]
let singleDigitPrimeNumbers : Set = [2,3,5,7]
// 全集
oddDigits.union(evenDigits).sorted()
// 交集
oddDigits.intersection(evenDigits).sorted()
// 差集
oddDigits.subtracting(singleDigitPrimeNumbers)
// 交集的补集
oddDigits.symmetricDifference(singleDigitPrimeNumbers)

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
// 判断是否是子集
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

/// 字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports.count

if airports.isEmpty {
    print("The airports dictionary is empty.")
}else {
    print("The airports dictionary is not empty.")
}
airports["LHR"] = "london"
airports["LHR"] = "London Heathrow"
// 更新字典
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}
// 遍历字典
for (airportCode,airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// 单独遍历键值
for airportCode in airports.keys{
     print("Airport code: \(airportCode)")
}

for airportName in airports.values{
    print("Airport name: \(airportName)")
}
// 键值数组实例化
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)



