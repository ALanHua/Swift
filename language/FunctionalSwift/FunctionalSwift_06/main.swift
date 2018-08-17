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



