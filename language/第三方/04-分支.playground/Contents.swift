//: Playground - noun: a place where people can play

import UIKit
/*
  if 语句不能去掉{}
  条件只能是true 或者 false
 */
let num = 10
if num == 10 {
    print("OK")
}

/*
  括号可以省略
  break 可以省略 不会穿透
  defaulf 必须放到最后 且大部分情况下不能省略
 */
switch num {
case 1:
    print("1")
case 5:
    print("5")
case 10:
    print("10")
default:
    print("NO")
}




