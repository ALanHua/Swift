//
//  main.swift
//  43_unowned_weak
//
//  Created by yhp on 2017/11/16.
//  Copyright © 2017年 YouHuaPei. All rights reserved.
//

import Foundation

class A: NSObject {
    let b:B
    override init() {
        b = B()
        super.init()
        b.a = self
    }
    deinit {
        print("A deinit")
    }
}

class B: NSObject {
    weak var a: A? = nil
    deinit {
        print("B deinit")
    }
}

var obj:A? = A()
obj = nil

@objc protocol RequestHandler {
    @objc optional func requestFinished()
}

class Request {
    weak var delegate:RequestHandler!
    func send(){
        
    }
    func gotResponse(){
        delegate?.requestFinished?()
    }
}


class RequestManager: RequestHandler {
    @objc func requestFinished() {
        print("请求完成")
    }
    func sendRequest() {
        let req = Request()
        req.delegate = self
        req.send()
    }
}

/// 闭包中使用self
class Person {
    let name:String
    lazy var printName:()->() = {
        [weak self] in
        if let strongSelf = self {
            print("The name is \(strongSelf.name)")
        }
    }
//   多个需要标注
//    {
//        [unowned self,weak somObject] (number:Int) ->Bool in
//        return true
//    }
    
    init(personName:String) {
        name = personName
    }
    
    deinit {
         print("Person deinit \(self.name)")
    }
}
var xiaoMing:Person? = Person(personName: "xiaoMing")
xiaoMing!.printName()
xiaoMing = nil










