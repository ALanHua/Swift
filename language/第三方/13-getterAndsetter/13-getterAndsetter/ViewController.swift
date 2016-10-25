//
//  ViewController.swift
//  13-getterAndsetter
//
//  Created by yhp on 2016/10/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 在swift 不需要导入类的头文件
        // 只要是在一个命名空间中的资源是共享的
        // 默认情况下，项目名称就是命名空间
        // 使用cocapods
        let p = Person()
        p.name = "YHp"
        print(p.name)
        p.gender = "man"
        print(p.age)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

