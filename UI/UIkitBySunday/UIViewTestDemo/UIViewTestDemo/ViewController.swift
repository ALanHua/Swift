//
//  ViewController.swift
//  UIViewTestDemo
//
//  Created by yhp on 15/10/2.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var sundyView = UISundyView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        sundyView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(sundyView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

