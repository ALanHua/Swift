//
//  ViewController.swift
//  UIProgressDemo
//
//  Created by yhp on 15/9/14.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progree1: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progree1.progress = 0
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changProgress:", userInfo: nil, repeats: true)
    }
    func changProgress(sender:NSTimer){
        progree1.progress += 0.1
        if progree1.progress >= 1{
            println("\(progree1.progress)")
            sender.invalidate()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

