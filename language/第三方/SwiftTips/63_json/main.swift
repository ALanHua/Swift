//
//  main.swift
//  63_json
//
//  Created by yhp on 2017/11/23.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let jsonString = "{\"menu\": {" +
    "\"id\": \"file\"," +
    "\"value\": \"File\"," +
    "\"popup\": {" +
    "\"menuitem\": [" +
    "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}," +
    "{\"value\": \"Open\", \"onclick\": \"OpenDoc()\"}," +
    "{\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}" +
    "]" +
    "}" +
"}}"

struct Obj: Codable {
    let menu: Menu
    struct Menu: Codable {
        let id: String
        let value: String
        let popup: Popup
    }
    
    struct Popup: Codable {
        let menuItem: [MenuItem]
        enum CodingKeys: String, CodingKey {
            case menuItem = "menuitem"
        }
    }
    
    struct MenuItem: Codable {
        let value: String
        let onClick: String
        
        enum CodingKeys: String, CodingKey {
            case value
            case onClick = "onclick"
        }
    }
}

let data = jsonString.data(using: .utf8)!
do {
    let obj = try JSONDecoder().decode(Obj.self, from: data)
    let value = obj.menu.popup.menuItem[0].value
    print(value)
} catch {
    print(error)
}










