//
//  main.swift
//  AdvanceSwift_09
//
//  Created by yhp on 2018/10/28.
//  Copyright © 2018 none. All rights reserved.
//

import Foundation

// 错误处理
enum Result<A> {
    case failure(Error)
    case success(A)
}

enum FileError:Error {
    case fileDoesNotExist
    case noPermission
}

func contexts(ofFile filename:String) -> Result<String> {
    return .success(filename)
}

let result = contexts(ofFile: "input.txt")

switch result {
case let .success(contexts):
    print(contexts)
case let .failure(error):
    if let fileError = error as? FileError,
        fileError == .fileDoesNotExist{
        print("File not found")
    }else{
        // 处理错误
        
    }
}
// 抛出和捕获
func contexts2(ofFile filename:String)throws -> String {
   throw FileError.fileDoesNotExist
}

do{
    let result = try contexts2(ofFile: "input.txt")
    print(result)
}catch FileError.fileDoesNotExist{
    print("File not found")
}catch {
    print(error)
}

// 带有e类型的错误
enum Result2<A,ErrorType:Error> {
    case failure(ErrorType)
    case success(A)
}

enum ParseError:Error {
    case wrongEncoding
    case warning(line:Int,message:String)
}

// 将错误桥接到Objective-C

/**
 LocalizedError -- 提供一个本地化的信息，来表示错误
 RecoverableError -- 一个用户l可以恢复的错误
 */
extension ParseError :CustomNSError {
    static let errorDomain = "parseError"
    var errorCode: Int{
        switch self {
        case .wrongEncoding:
            return 100
        case .warning(line: _, message: _):
            return 200
        }
    }
    
    var errorUserInfo: [String : Any]{
        return [:]
    }
}

//错误和函数参数

func checkFile(filename:String) throws -> Bool{
    return false;
}

func checkAllFiles(filenames:[String]) throws -> Bool {
    for filename in filenames {
        guard try checkFile(filename: filename) else{
            return false
        }
    }
    return true
}

// Rethrows 只会在它的参数函数抛出错误的时候抛出错误
// 但那些像函数中传递的是不会抛出错误的
// 编译器可以免除我们一定要使用try来调用
// 标准库
extension Sequence {
    func all(matching predicate:(Element) throws -> Bool) rethrows
        -> Bool{
        for element in self {
            guard try predicate(element) else{
                return false
            }
        }
        return true
    }
}

func checkAllFiles2(filenames:[String]) throws -> Bool {
    return try filenames.all(matching: checkFile)
}

// 使用defer 进行清理 从作用域中退出是调用defer包含的代码块
func contexts3(ofFile filename:String)throws -> String {
    let file = open("text.txt", O_RDONLY)
    defer {
        close(file)
    }
    // .....
    return ""
}

// 错误和可选值
extension Optional {
    func or(error:Error)throws -> Wrapped {
        switch self {
        case let x?:
            return x
        case nil:
            throw error
        }
    }
}

enum ReadIntEoor : Error{
    case couldNotRead
}

do {
    let int = try Int("42").or(error:ReadIntEoor.couldNotRead)
    print(int)
}catch{
    print(error)
}

// 错误链
