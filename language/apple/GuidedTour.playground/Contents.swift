//: Playground - noun: a place where people can play

import UIKit

//: 常量 和 变量

let π = 3.14159
let 你好 = "你好世界"
let 🐹 = "dogcow"

var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour"
print(friendlyWelcome);print("\(friendlyWelcome)")
// 整数
let minValue = UInt8.min
let maxValue = UInt8.max

// 类型推断
let meaningOfLife = 42// Int
let pi = 3.1415926
let anotherPi = 3 + 0.1415926
// 数字文字
/// 各种进制表示方法
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger  = 0o21
let hexadecimalInteger = 0x11
/// 指数表示方法
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
/// 长数字的表示方法
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
/// 数据类型转换
//let cannotBeNegative: UInt8 = -1
let twoThousand: UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
/// 类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
/// 布尔类型
let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("tasty turnips!")
}else{
    print("turnips are horrible")
}
/// 元组
let http404Error = (404,"Not Found")
let (statusCode,statusMessage) = http404Error
statusCode
statusMessage
print("code is \(statusCode),message is \(statusMessage)")
let (justTheStatusCode,_) = http404Error
justTheStatusCode
http404Error.0
http404Error.1
let http2005sStatus = (statusCode:200,description:"OK")
http2005sStatus.statusCode
http2005sStatus.description
/// 数字字符串转换成数字
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
/// 零 可选
var serverResponseCode: Int? = 404
serverResponseCode = nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value of \(convertedNumber!)")
}
/// 可选绑定
if let actualNumber = Int(possibleNumber){
    print("\"\(possibleNumber)\" \(actualNumber)")
}else{
    print("\"\(possibleNumber)\"  could not be converted to be a integer")
}














