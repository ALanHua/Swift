//
//  ViewController.swift
//  UINavgationControllerDemo2
//
//  Created by yhp on 15/9/28.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue1"{
            (segue.destinationViewController as? ViewController2)?.name = "sundy"
        }
        
    }
    @IBAction func unWinToFirst(segue: UIStoryboardSegue){
        
    }
}

