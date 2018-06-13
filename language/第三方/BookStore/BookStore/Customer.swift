//
//  Customer.swift
//  BookStore
//
//  Created by yhp on 2018/6/13.
//  Copyright © 2018年 none. All rights reserved.
//

import UIKit

class Customer: NSObject {
//    属性
    var firstName = ""
    var lastName = ""
    var addressLine1 = ""
    var addressLine2 = ""
    var city = ""
    var state = ""
    var zip = ""
    var phoneNumber = ""
    var emailAddress = ""
    var favoriteGenre = ""
//  方法
    func listPurchaseHistory() -> [String] {
        return ["Purchase 1","Purchase 2"]
    }
    
}
