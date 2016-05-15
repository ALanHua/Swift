//
//  ViewController.swift
//  UIControlDemo
//
//  Created by yhp on 15/9/13.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func editingChanged(sender: UITextField) {
          NSLog("editingChanged")
    }
    @IBAction func editingDidBegin(sender: UITextField) {
        NSLog("editingDidBegin")
    }
    
    @IBAction func editingDidEnd(sender: UITextField) {
         NSLog("editingDidEnd")
    }
    @IBAction func editingDidEndOnExit(sender: UITextField) {
        NSLog("editingDidEndOnExit")
    }
    
    @IBAction func buttonDown(sender: UIButton) {
        NSLog("buttonDown")
    }
    @IBAction func buttonDownRepeat(sender: UIButton) {
        NSLog("buttonDownRepeat")
    }
    @IBAction func buttonEnter(sender: UIButton) {
        NSLog("buttonEnter")
    }
    @IBAction func buttonDragExit(sender: UIButton) {
         NSLog("buttonDragExit")
    }
    
    @IBAction func buttonDragInside(sender: UIButton) {
        NSLog("buttonDragInside")
    }
    @IBAction func buttonDragOutside(sender: UIButton) {
        NSLog("buttonDragOutside")
    }
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

