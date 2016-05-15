//
//  ViewController.swift
//  testFieldDemo
//
//  Created by yhp on 15/9/13.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var testField1: UITextField!
    @IBAction func testField1(sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func controlTestField1(sender: UIControl) {
         testField1.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

