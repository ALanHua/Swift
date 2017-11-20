//
//  main.swift
//  55_callback_clib
//
//  Created by yhp on 2017/11/20.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

extension String {
    var MD5:String {
        var digest = [UInt8](repeating:0,count:Int(CC_MD5_DIGEST_LENGTH))
        if let data = data(using: .utf8){
            data.withUnsafeBytes({ (bytes:UnsafePointer<UInt8>) -> Void in
                CC_MD5(bytes, CC_LONG(data.count), &digest)
            })
        }
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format:"%02x",digest[index])
        }
        return digestHex
    }
}

print("Switf.tips".MD5)

