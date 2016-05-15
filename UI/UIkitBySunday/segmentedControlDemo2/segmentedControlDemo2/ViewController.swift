//
//  ViewController.swift
//  segmentedControlDemo2
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

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var testField1: UITextField!
    
    @IBAction func buttonAdd(sender: UIButton) {
        segmentedControl.insertSegmentWithTitle(testField1.text, atIndex: segmentedControl.numberOfSegments, animated: true)
    }
    
    @IBAction func buttonRemove(sender: UIButton) {
        segmentedControl.removeSegmentAtIndex(segmentedControl.numberOfSegments-1, animated: true)
    }
    
    @IBAction func segmentValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.view.backgroundColor =
                UIColor.blackColor()
        case 1:
            self.view.backgroundColor =
                UIColor.whiteColor()
        case 2:
            self.view.backgroundColor =
                UIColor.greenColor()
        case 3:
            self.view.backgroundColor =
                UIColor.yellowColor()
        default:
            self.view.backgroundColor =
                UIColor.grayColor()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

