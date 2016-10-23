//: Playground - noun: a place where people can play

import UIKit

/*
 func 函数名（参数列表) -> 返回值
 {
    // 执行代码
 }
 */
// 没有返回值，没有参数
// 如果没有返回值还可以简写
func say() ->Void
{
    print("hello")
}
say();
// () <---> void
func say2() ->()
{
    print("hello")
}
say2()
func say3()
{
    print("hello")
}
say3()
// 有返回值,没有参数的
func getNumber() ->Int
{
    return 998
}
print(getNumber())
// 有参数，没有返回值
func sum(a:Int,b:Int)
{
    print(a+b)
}
sum(a: 10, b: 20)
//
func sum2(x a:Int,y b:Int)
{
    print(a+b)
}
sum2(x: 10, y: 30)
//
func sum4(a:Int,b:Int)->Int
{
    return a + b
}
print(sum4(a: 30, b: 40))





