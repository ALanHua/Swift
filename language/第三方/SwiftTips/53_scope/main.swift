//
//  main.swift
//  53_scope
//
//  Created by yhp on 2017/11/20.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class TodoItem {
    let uuid:String
    var tittle:String
    
    init(uuid:String,tittle:String) {
        self.uuid = uuid
        self.tittle = tittle
    }
}

extension TodoItem:Equatable{
    
}

func ==(lhs:TodoItem,rhs:TodoItem) -> Bool {
    return lhs.uuid == rhs.uuid
}





