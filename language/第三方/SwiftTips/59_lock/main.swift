//
//  main.swift
//  59_lock
//
//  Created by yhp on 2017/11/21.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

func synchronized(_ lock:AnyObject!,closure:()->()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

class Obj {
    var str_ = "123"
    var str:String{
        get{
            return str_
        }
        set{
            synchronized(self) {
                str_ = newValue
            }
        }
    }
    
}
