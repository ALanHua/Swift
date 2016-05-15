//
//  ViewController.swift
//  UISteperDemo
//
//  Created by yhp on 15/9/15.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testField1: UITextField!
    @IBOutlet weak var stepper1: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          testField1.text = NSString(format: "%g", stepper1.value) as String
    }

    @IBAction func stepper1(sender: UIStepper) {
        testField1.text = NSString(format: "%g", sender.value) as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

