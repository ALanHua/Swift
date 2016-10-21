//: Playground - noun: a place where people can play

import UIKit
/*
 swift3 已经将C style 方式移除掉
 0..<10  [0,10)
 */
for i in 0 ..< 10{
    print(i)
}
/*
 __ 代表忽略参数
 */
for __ in 0..<10{
    print("yhp");
}

/*
 while 循环，很少使用
 */
var a = 0
while a < 10 {
   print(a)
   a += 1;
}

/* do while 没有do 了*/
var b = 0
repeat {
    print(b)
    b += 1
}while b < 10


