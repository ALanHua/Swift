//
//  ViewController.swift
//  UIPanGesture
//
//  Created by yhp on 15/10/2.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func panGestureDone(sender: UIPanGestureRecognizer) {
        var _tansX = sender.translationInView(greenView).x
        var _tansY = sender.translationInView(greenView).y
        
        greenView.transform = CGAffineTransformMakeTranslation(_tansX, _tansY)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

