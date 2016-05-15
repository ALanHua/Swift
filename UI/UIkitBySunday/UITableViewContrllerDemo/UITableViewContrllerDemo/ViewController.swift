//
//  ViewController.swift
//  UITableViewContrllerDemo
//
//  Created by yhp on 15/9/27.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button(sender: UIButton) {
        label1.text = "hello"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

