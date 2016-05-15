//
//  TodoList.swift
//  LocalNotificationsTutorial
//
//  Created by yhp on 15/10/9.
//  Copyright © 2015年 YouHuaPei. All rights reserved.
//

import Foundation
import UIKit
private let ITEMS_KEY = "todoItems"
class TodoList {
    //单例
    private static let sharedInstance = TodoList()
    class var sharedTodoList: TodoList {
        return sharedInstance
    }
    func allItems() -> [TodoItem] {
        let todoDictornary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ITEMS_KEY) ?? [:]
        let items = Array(todoDictornary.values)
        return items.map({TodoItem(deadline: $0["deadline"] as! NSDate, title: $0["title"] as! String, UUID: $0["UUID"] as! String!)}).sort({(left: TodoItem, right:TodoItem) -> Bool in
            (left.deadline.compare(right.deadline) == .OrderedAscending)
        })
    }
    
    func addItem(item: TodoItem){
        var todoDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ITEMS_KEY) ?? Dictionary()
        todoDictionary[item.UUID] = ["deadline":item.deadline,"title":item.title,"UUID":item.UUID]
        NSUserDefaults.standardUserDefaults().setObject(todoDictionary, forKey: ITEMS_KEY)
        let notification = UILocalNotification()
        notification.alertBody = "Todo Item \"\(item.title)\" Is Overdue"
        notification.alertAction = "open"
        notification.fireDate = item.deadline
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["UUID":item.UUID,]
        notification.category = "TODO_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    func removeItem(item: TodoItem){
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications! as [UILocalNotification] {
            if notification.userInfo!["UUID"] as! String == item.UUID{
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                break
            }
            if var todoItems = NSUserDefaults.standardUserDefaults().dictionaryForKey(ITEMS_KEY){
                todoItems.removeValueForKey(item.UUID)
                NSUserDefaults.standardUserDefaults().setObject(todoItems, forKey: ITEMS_KEY)
            }
        }
    }
}
