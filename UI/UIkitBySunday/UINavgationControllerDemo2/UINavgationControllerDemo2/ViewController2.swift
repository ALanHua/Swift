//
//  ViewController2.swift
//  UINavgationControllerDemo2
//
//  Created by yhp on 15/9/28.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var name = ""
    
    @IBOutlet weak var button2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button2.setTitle(name, forState: UIControlState.Normal)
    }
    

}
