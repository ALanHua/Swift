//
//  main.swift
//  65_log
//
//  Created by yhp on 2017/11/23.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func printLog<T>(_ message: T,
                      file: String = #file,
                      method: String = #function,
                      line: Int = #line){
    
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}
// Test.swift
func method1() {
    //...
    printLog("这是一条输出")
    //...
}

method1()

func printLogDebug<T>(_ message: T,
                      file: String = #file,
                      method: String = #function,
                      line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

func method2() {
    //...
    printLogDebug("这又是一条输出")
    //...
}

method2()
// No Output
