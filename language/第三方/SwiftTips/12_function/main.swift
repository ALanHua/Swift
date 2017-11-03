//
//  main.swift
//  12_function
//
//  Created by yhp on 2017/11/3.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

/***
 namespace
 */

/// framework 层
public class MyClass{
    public class func hello(){
        print("hello from framework")
    }
}

/// app层
class MyClass2 {
    class func hello(){
        print("hello from app")
    }
}


/// 结构体嵌套
struct MyClassContainer {
    class MyClass {
        class func hello(){
            print("hello from MyClassContainer")
        }
    }
}




