//
//  ViewController.swift
//  UILongPressGesture
//
//  Created by yhp on 15/10/2.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func longPressGestureDone(sender: UILongPressGestureRecognizer) {
       UIAlertView(title: "longPress", message: "你长按了", delegate: self, cancelButtonTitle: "OK").show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

