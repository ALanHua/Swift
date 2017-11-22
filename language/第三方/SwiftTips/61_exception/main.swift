//
//  main.swift
//  61_exception
//
//  Created by yhp on 2017/11/22.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

enum Result {
    case Success(String)
    case Error(NSError)
}

//func doSomethingParam(param:AnyObject) ->  Result{
//    ///
//    if success {
//        return Result.Success("成功完成")
//    }else{
//        let error = NSError(domain: "errorDomain", code: 1, userInfo: nil)
//
//        return Result.Error(error)
//    }
//}
enum E:Error {
    case Negative
}

func methodThrowWhenPassingNegative(number:Int) throws -> Int? {
    if number < 0 {
        throw E.Negative
    }
    if number == 0 {
        return nil
    }
    
    return number
}

if let num = try? methodThrowWhenPassingNegative(number: 0){
    print(type(of: num))
}else{
    print("failed")
}

func methodThrows(num: Int) throws {
    if num < 0 {
        print("Throwing!")
        throw E.Negative
    }
    print("Executed!")
}
func methodRethrows(num:Int,f: (Int) throws ->()) rethrows{
    try f(num)
}

do{
    try methodRethrows(num: 1,f: methodThrows)
}catch _ {
    
}










