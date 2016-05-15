//
//  ViewController.swift
//  UISliderDemo
//
//  Created by yhp on 15/9/14.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var slider1: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderValueChanged(sender: UISlider) {
        image.alpha = CGFloat(sender.value)
        NSLog(NSString(format: "%.2f", sender.value) as String)
        slider1.setThumbImage(UIImage(named: "voice"), forState:UIControlState.Normal)
        slider1.setThumbImage(UIImage(named: "voice"), forState:UIControlState.Highlighted)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

