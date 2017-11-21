//
//  main.swift
//  58_associated_object
//
//  Created by yhp on 2017/11/21.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class MyClass {
}
private var key:Void?
extension MyClass {
    var tittle:String?{
        get{
            return objc_getAssociatedObject(self, &key) as? String
        }
        set{
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
func printTitle(_ input: MyClass){
    if let tittle = input.tittle {
        print("Title \(tittle)")
    }else{
        print("没有设置")
    }
}
let a = MyClass()
printTitle(a)
a.tittle = "Andy"
printTitle(a)






