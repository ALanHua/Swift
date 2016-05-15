//
//  ViewController.swift
//  UISegmertedControlDemo
//
//  Created by yhp on 15/9/13.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmented1: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func segmentedValueChange(sender: UISegmentedControl) {
        NSLog("select \(segmented1.selectedSegmentIndex)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

