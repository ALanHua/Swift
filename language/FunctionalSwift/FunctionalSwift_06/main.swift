//
//  main.swift
//  FunctionalSwift_06
//
//  Created by yhp on 2018/8/17.
//  Copyright © 2018年 none. All rights reserved.
//

import Foundation

// 枚举

enum Encoding {
    case ASCII
    case NEXTSTEP
    case JapaneseEUC
    case UTF8
}

extension Encoding {
    var nsStringEncoding:String.Encoding {
        switch self {
        case .ASCII:
            return String.Encoding.ascii
        case .NEXTSTEP:
            return String.Encoding.nextstep
        case .JapaneseEUC:
            return String.Encoding.japaneseEUC
        case .UTF8:
            return String.Encoding.utf8
        }
    }
    
}

func localizedEncodingName(encoding:Encoding) -> String {
    return .localizedName(of: encoding.nsStringEncoding)
}

enum LookupError:Error {
    case CaptialNotFound
    case PopulationNotFound
}

enum PopulationResult {
    case Success(Int)
    case Error(LookupError)
}

let exampleSuccess:PopulationResult = .Success(10000)
print(exampleSuccess)

let capitals = [
    "France": "Paris",
    "Spain": "Madrid",
    "The Netherlands": "Amsterdam",
    "Belgium": "Brussels"
]
let cities = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin": 3562]

func populationOfCapital(country:String) -> PopulationResult {
    guard let capital = capitals[country] else {
        return .Error(.CaptialNotFound)
    }
    guard let population = cities[capital] else {
        return .Error(.CaptialNotFound)
    }
    return .Success(population)
}

// 解错误类型的包裹
switch populationOfCapital(country: "France"){
case let .Success(population):
    print("France's capital has \(population) thousand inhabitants")
case let .Error(error):
    print("Error:\(error)")

}

// 添加泛型
let mayors = [
    "Paris": "Hidalgo",
    "Madrid": "Carmena",
    "Amsterdam": "van der Laan",
    "Berlin": "Müller"
]

func mayorOfCapital(country:String) -> String? {
    return capitals[country].flatMap{mayors[$0]}
}

enum Result<T> {
    case Success(T)
    case Error(Error)
}






