//
//  Person.swift
//  13-getterAndsetter
//
//  Created by yhp on 2016/10/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class Person: NSObject {
    // 不介意这样写
    var _name : String?
    var name : String?{
        get{
          return _name
        }
        set{
            // 只要外界给name 赋值就赋值给 newValue
           _name = newValue
        }
    }
    
    var gender:String?{
        // 设置完值后调用
        didSet{
            print(gender) 
        }
    }
    // 如果冲洗getter方法，该属性属于计算型，相当于OC中的只读属性
    // 计算性不占用空间  
    var age:Int{
        get{
            return 30
        }
    }
    
    
}
