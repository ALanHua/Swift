//
//  TodoItem.swift
//  LocalNotificationsTutorial
//
//  Created by yhp on 15/10/9.
//  Copyright © 2015年 YouHuaPei. All rights reserved.
//

import Foundation

struct TodoItem {
    var title :String
    var deadline: NSDate
    var UUID: String
    
    init(deadline: NSDate,title :String,UUID: String){
        self.deadline = deadline
        self.title = title
        self.UUID = UUID
    }
//    判断代办事项是否过期
    var isOverdue: Bool{
        return (NSDate().compare(self.deadline) == NSComparisonResult.OrderedDescending)
    }
}