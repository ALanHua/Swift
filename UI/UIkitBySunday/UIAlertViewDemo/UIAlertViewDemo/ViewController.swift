//
//  ViewController.swift
//  UIAlertViewDemo
//
//  Created by yhp on 15/9/15.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func alertButtonClick(sender: AnyObject) {
       var alertView1 = UIAlertView(title: "hello", message: "hello everyone", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "Cancel")
        alertView1.show()
        alertView1.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
       var inputValue = alertView.textFieldAtIndex(0)?.text
        UIAlertView(title: "Value", message: "button\(inputValue)", delegate: nil, cancelButtonTitle: "OK").show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

