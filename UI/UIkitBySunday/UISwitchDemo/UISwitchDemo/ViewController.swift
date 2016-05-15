//
//  ViewController.swift
//  UISwitchDemo
//
//  Created by yhp on 15/9/14.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activity1: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func swich1(sender: UISwitch) {
        if sender.on {
            NSLog("On")
            self.view.backgroundColor = UIColor.redColor()
            activity1.startAnimating()
        }else{
            self.view.backgroundColor = UIColor.blackColor()
             NSLog("Off")
            activity1.stopAnimating()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

