//
//  ViewController.swift
//  UITapDemo
//
//  Created by yhp on 15/10/2.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
/*1,建立手势识别器
 *2,关联View
 *3,实现Action
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func redViewTap(sender: UITapGestureRecognizer) {
        NSLog("red tap")
        sender.locationInView(self.view)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

