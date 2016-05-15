//
//  ViewController.swift
//  UILabelDemo
//
//  Created by yhp on 15/9/12.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label2.text = "hello label2"
        self.view.addSubview(label2)
        label.textAlignment = NSTextAlignment.Center
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

