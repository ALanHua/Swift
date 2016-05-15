//
//  ViewController.swift
//  UITapDemo2
//
//  Created by yhp on 15/10/2.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func redViewPinch(sender: UIPinchGestureRecognizer) {
        var _height = redView1.bounds.height
        var _width = redView1.bounds.width
        redView1.bounds.size = CGSize(width: _width * sender.scale, height: _height * sender.scale )
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

