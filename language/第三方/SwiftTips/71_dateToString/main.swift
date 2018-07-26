//
//  main.swift
//  71_dateToString
//
//  Created by yhp on 2018/7/24.
//  Copyright © 2018年 YouHuaPei. All rights reserved.
//

import Foundation

let currentdate = Date()
let dateformatter = DateFormatter()
dateformatter.dateStyle = .full
dateformatter.timeStyle = .long
let dateString = dateformatter.string(from: currentdate)
print(dateString)
// MARK: 自定义模式
dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
let customDate = dateformatter.string(from: currentdate)
print(customDate)
// MARK: 拆分Date
let calendar = Calendar.current
var dateComponents = calendar.dateComponents([.year,.month, .day, .hour,.minute,.second], from: currentdate)
//  设置时区
dateComponents.timeZone = TimeZone(abbreviation: "GMT")
print("\(dateComponents.hour!),\(dateComponents.minute!),\(dateComponents.second!)")

//  string -> date
let dateformatter1 = DateFormatter()
dateformatter1.dateFormat = "MM dd,YYYY"
var dateAString = "Oct 05,2018"
var date1 = dateformatter1.date(from: dateAString)
print("\(date1!)")

// MARK: 闭包复习，这个经常忘
/*
  语法：
 {(parameters) -> return type in
    statements
 }
 {(Int, Int) -> Bool in
     Statement 1
     ......
     Statement n
 }
 */
let ex = {
    print("Swift 闭包函数。")
}
ex()
let divide = {(value1:Int,value2:Int) -> Int in
    return value1 / value2
}
let result = divide(200,10)
print(result)

let names = ["AT", "AE", "D", "S", "BE"]
func backwords(s1: String,s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: backwords)
print(reversed)
// 简化
var reversed2 = names.sorted { (s1, s2) -> Bool in
    return s1 > s2
}
print(reversed2)
var reversed3 = names.sorted(by : {$0 > $1})
print(reversed3)
var reversed4 = names.sorted(by : >)
print(reversed4)
// 尾闭包
/*
 func someFunctionThatTakesAClosure(closure: () -> Void) {
     // 函数体部分
 }
 // 以下是不使用尾随闭包进行函数调用
 someFunctionThatTakesAClosure({
     // 闭包主体部分
 })
 someFunctionThatTakesAClosure() {
     // 闭包主体部分
 }
 */
let reversed5 = names.sorted(){$0 > $1}
print(reversed5)
// 捕获值 说明 闭包是引用类型
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

// 高阶函数介绍
//  1.map
let price = [20,30,40]
let strs = price.map (){ "$\($0)"}
print(strs)
// 2,flatMap 方法同 map 方法比较类似，只不过它返回后的数组中不存在 nil（自动把 nil 给剔除掉），同时它会把 Optional 解包。
let array = ["Apple", "Orange", "Grape", ""]
let arr1 = array.map { (a) -> Int? in
    let length = a.count
    guard length > 0 else{
        return nil
    }
    return length
}
print(arr1)
// MARK: swift 4.x 已经将flatMap这个功能用 compactMap 替换了
let arr2 = array.compactMap { (a) -> Int? in
    let length = a.count
    guard length > 0 else{
        return nil
    }
    return length
}
print(arr2)




