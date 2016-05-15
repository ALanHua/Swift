//
//  ViewController.swift
//  CustomGesture
//
//  Created by yhp on 15/10/3.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var newGesture = UICostomGestureRecognizer(target: self, action: "handleCostomGesture:")
        greenView.addGestureRecognizer(newGesture)
    }

    func handleCostomGesture(sender: UIGestureRecognizer){
        NSLog("滑动斜线成功")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

