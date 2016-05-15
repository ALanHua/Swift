//
//  ViewController.swift
//  RecognitionDemo
//
//  Created by yhp on 15/9/29.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//         1，建立手势识别器
        var gesture1 = UITapGestureRecognizer(target: self, action: "view1Tap:")
//        2,附件手势识别器到视图
        view1.addGestureRecognizer(gesture1)
//        3，实现方法
    }

    @IBAction func view1Tap(sender: UITapGestureRecognizer) {
        NSLog("Click")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

