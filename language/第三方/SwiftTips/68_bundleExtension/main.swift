//
//  main.swift
//  68_bundleExtension
//
//  Created by yhp on 2018/5/27.
//  Copyright © 2018年 YouHuaPei. All rights reserved.
//

import Foundation

extension Bundle{
    func imagePath(_ forResource: String?,ofType:String?,screamScale:Float) -> String? {
        guard forResource != nil else {
            return nil;
        }
        
        guard ofType != nil else {
            return nil;
        }
        
        var scaleStr: String = "@2x"
        if screamScale == 3.0{
            scaleStr = "@3x"
        }else if creamScale == 1.0{
            scaleStr = "@1x"
        }
        var path = self.path(forResource: forResource + scaleStr, ofType: ofType)
        if path == nil {
            path = self.path(forResource: forResource, ofType: ofType)
        }
        return path
    }
}

