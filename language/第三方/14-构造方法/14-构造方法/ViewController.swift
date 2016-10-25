//
//  ViewController.swift
//  14-构造方法
//
//  Created by yhp on 2016/10/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = Person()
        print("\(p.name),\(p.age)")
        
        let p2 = Person(name: "zs", age: 88)
        print("\(p2.name),\(p2.age)")
        let p3 = Person(dict: ["name":"a" as NSObject,"age":"124" as NSObject])
         print("\(p3.name),\(p3.age)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

