//
//  main.swift
//  41_objc_dynamic
//
//  Created by yhp on 2017/11/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

/**
 Object-C 可以通过@import xxx 导入Swift框架
 swift 中 可以使用@objc 修饰类和成员，oc就可以调用了
 */
//@import MySwiftKit

class 我的类: NSObject {
    func 打呼噜(名字:String)  {
        print("\(名字)")
    }
}
我的类().打呼噜(名字: "小明")
