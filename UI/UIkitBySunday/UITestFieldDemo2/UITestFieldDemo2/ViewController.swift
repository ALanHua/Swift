//
//  ViewController.swift
//  UITestFieldDemo2
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
    @IBOutlet weak var testField2: UITextField!
    @IBAction func testField1Exit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func testField2Exit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func buttonLoginClick(sender: UIButton) {
        if testField1.text == "yhp" && testField2.text == "yhp"{
            NSLog("登陆成功\n")
        }else{
             NSLog("登陆失败\n")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

