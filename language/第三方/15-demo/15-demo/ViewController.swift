//
//  ViewController.swift
//  15-demo
//
//  Created by yhp on 2016/10/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        view.backgroundColor = UIColor.green
        let btn = UIButton(type: UIButtonType.contactAdd)
        btn.center = CGPoint(x: 200, y: 200)
        btn.addTarget(self, action: #selector(ViewController.btnClick), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnClick(btn:UIButton){
        print("%s",#function)
        print(btn)
    }
}

