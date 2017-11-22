//
//  main.swift
//  62_assert
//
//  Created by yhp on 2017/11/22.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

let absoluteZeroInCelsius = -273.15

func convertToKelvin(_ celsius:Double) -> Double{
    assert(celsius > absoluteZeroInCelsius)
    return celsius - absoluteZeroInCelsius
}

let roomTemperature = convertToKelvin(27)
print(roomTemperature)

let tooCold = convertToKelvin(-300)
print(tooCold)


enum MyError {
    case Value1,Value2,Value3
}
func check(someValue:MyError) -> String {
    switch someValue {
    case .Value1:
        return "OK"
    case .Value2:
        return "Mybe OK"
    default:
        fatalError("Should not show")
    }
}







