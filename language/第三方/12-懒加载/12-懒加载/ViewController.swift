//
//  ViewController.swift
//  12-懒加载
//
//  Created by yhp on 2016/10/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 懒加载的固定写法,后面通过闭包赋值
    // 必须使用var,闭包必须跟上()
    lazy var dataList:[String] = {
        () -> [String]
        in
        print("我被执行了")
        return ["yhp","zs","xm"]
    }()
    
    // 闭包用于懒加载 in 之前都可以删除
    lazy var dataList2:[String] = {
        print("我被执行了")
        return ["yhp","zs","xm"]
    }()
    
    let demoFunc = {
        () -> [String]
        in
        return ["123","345","66"]
    }
    
    lazy var dataList3:[String] = self.demoFunc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(dataList)
        print(dataList)
        print(dataList)
        print(dataList3)
    }


}

