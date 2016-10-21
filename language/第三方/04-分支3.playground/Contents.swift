//: Playground - noun: a place where people can play

import UIKit

let num = 10
if num == 5 {
    print("5")
}else{
    print("10")
}

/*
 三目运算符
 */
let res = num == 5 ? 5 : 10

/*
 可选类型：代表着有也可以没有 Optional
 方法或者数据类型有？就是可选类型
 ! 代表编译器可选类型中一定有值，强制解析
 如果可选类型中没有值，程序就会崩溃
 */
let url = URL(string: "http://www.baidu.com")
print(url)
print(url!)
let url2 = URL(string:"http://www.baidu.com/image")
print(url2)

if url != nil {
    let request = NSURLRequest(url: url!)
}
// 可选绑定
if let urlFinal = url{// 将url 值赋值给urlFinal 如果不为空就执行下面的值
    let request2 = NSURLRequest(url: urlFinal)
}









