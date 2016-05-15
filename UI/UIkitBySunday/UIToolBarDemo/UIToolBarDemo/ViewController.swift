//
//  ViewController.swift
//  UIToolBarDemo
//
//  Created by yhp on 15/9/18.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolbar1: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var textField1 = UITextField(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        textField1.backgroundColor = UIColor.whiteColor()
        var buttonItem1 = UIBarButtonItem(customView: textField1)
        toolbar1.items?.append(buttonItem1)
    }

    @IBAction func playClick(sender: UIBarButtonItem) {
        NSLog("Click")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

