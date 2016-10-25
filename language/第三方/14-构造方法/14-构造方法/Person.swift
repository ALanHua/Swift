//
//  Person.swift
//  14-构造方法
//
//  Created by yhp on 2016/10/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class Person: NSObject {
    // 属性必须要有初始值
    // 只要在构造方法中初始化，那么就不需要写？
    var name:String?
    /*
     如果定义一个对象属性，那么后面写上一个问号
     如果定义一个基本数据，建议直接复制为0
     因为super.init在分配存储空间时，发现对象是可选会给分配存储空间
     但是属性是可选基本类型，super.init不会分配空间
     */
    var age:Int = 0
    // 如果自定义了构造方法，且没有重写父类的构造方法，那么默认的就失效了
    override init() {
        self.name = "yhp"
        self.age = 30
    }
    // swift 中有方法重载
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    // swift 想要使用kvc
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    
    
}
