//
//  ViewController.swift
//  UIActionSheetDemo
//
//  Created by yhp on 15/9/16.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIActionSheetDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheetClick(sender: AnyObject) {
        var actionSheet = UIActionSheet(title: "ActionSheet", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "OK")
        actionSheet.actionSheetStyle = UIActionSheetStyle.Default
        actionSheet.showInView(self.view)
        
    }
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        UIAlertView(title: "你点击了", message: "你点击button\(buttonIndex)", delegate: nil, cancelButtonTitle: "Cancel").show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

