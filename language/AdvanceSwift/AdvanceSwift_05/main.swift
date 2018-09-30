//
//  main.swift
//  AdvanceSwift_05
//
//  Created by yhp on 2018/9/21.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation
import CoreLocation

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

struct Placemark2:Codable {
    var name : String
    var coordinate: Coordinate
    
    private enum CodingKeys:String,CodingKey{
        case name = "label"
        case coordinate
    }
}

struct Placemark3:Codable {
    var name:String = "(Unknown)"
    var coordinate:Coordinate
    private enum CodingKeys:CodingKey {
        case coordinate
    }
}

struct Placemark4:Codable {
    var name : String
    var coordinate: Coordinate?
//    编码过程有编译器完成
//    覆盖解码代码
    init(form decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        do {
            self.coordinate = try container.decodeIfPresent(Coordinate.self, forKey: .coordinate)
        } catch DecodingError.keyNotFound {
            self.coordinate = nil
        }
    }
}

let invalidJsonInput = """
[
    {
        "name" : "ShangHai"
        "coordinate":{}
    }
]
"""

do{
    let inputData = invalidJsonInput.data(using: .utf8)
    let decoder = JSONDecoder()
    let decoded = try decoder.decode([Placemark4].self, from: inputData!)
    print(decoded)
}catch {
    print(error.localizedDescription)
}


struct Placemark5:Codable {
    var name : String
    var coordinate: CLLocationCoordinate2D
}

extension Placemark5 {
    private enum CodingKeys: String,CodingKey {
        case name
        case latitude = "lat"
        case longitude = "lon"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.coordinate = CLLocationCoordinate2D(latitude: try container.decode(Double.self, forKey: .latitude), longitude: try container.decode(Double.self, forKey: .longitude))
    }
    
}
// 嵌套容器
struct Placemark6:Encodable {
    var name : String
    var coordinate: CLLocationCoordinate2D
    
    private enum CodingKeys: CodingKey{
        case name
        case coordinate
    }
    
    private enum CoordinateCodingKeys: CodingKey{
        case latitude
        case longitude
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        var coordinateContainer = container.nestedContainer(keyedBy: CoordinateCodingKeys.self, forKey: .coordinate)
        try coordinateContainer.encode(coordinate.latitude, forKey: .latitude)
        try coordinateContainer.encode(coordinate.longitude, forKey: .longitude)
        
    }
    
}

// 使用计算属性绕开问题, Codable系统会将它忽略掉
struct Placemark7: Codable {
    var name: String
    private var _coordinate: Coordinate
    var coordinate:CLLocationCoordinate2D {
        get{
            return CLLocationCoordinate2D(latitude: _coordinate.latitude, longitude: _coordinate.longitude)
        }
        set{
            _coordinate = Coordinate(latitude: newValue.latitude, longitude: newValue.longitude)
        }
    }
    
    private enum CoodingKeys: String,CodingKey {
        case name
        case _coordinate = "coordinate"
    }
}

// swift 4 中我们不能为一个非final的类添加Codable特性
// 枚举满足 Codable
enum Either<A:Codable,B:Codable>:Codable {
    case left(A)
    case right(B)
    private enum CodingKeys:CodingKey {
        case left
        case right
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .left(let value):
            try container.encode(value, forKey: .left)
        case .right(let value):
            try container.encode(value, forKey: .right)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let leftValue = try container.decodeIfPresent(A.self, forKey: .left) {
            self = .left(leftValue)
        }else{
            let rightValue = try container.decode(B.self, forKey: .right)
            self = .right(rightValue)
        }
    }
}


