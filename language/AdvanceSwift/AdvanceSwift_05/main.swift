//
//  main.swift
//  AdvanceSwift_05
//
//  Created by yhp on 2018/9/21.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// Codable
struct Coordinate:Codable {
    var latitude : Double
    var longitude : Double
    
}

struct Placemark:Codable {
    var name:String
    var coordinate:Coordinate
}

let places = [
    Placemark(name: "beijin", coordinate: Coordinate(latitude: 52, longitude: 13)),
    Placemark(name: "shanghai", coordinate: Coordinate(latitude: 60, longitude: 20))
]

do {
    let encoder = JSONEncoder()
    let jsonData = try encoder.encode(places)
    let jasonString = String(decoding: jsonData, as: UTF8.self)
    print(jasonString)
    let decoder = JSONDecoder()
    let decoded = try decoder.decode([Placemark].self, from: jsonData)
    print(decoded.description)
}catch {
    print(error.localizedDescription)
}





