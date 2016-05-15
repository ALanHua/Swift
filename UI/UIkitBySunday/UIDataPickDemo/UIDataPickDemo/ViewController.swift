//
//  ViewController.swift
//  UIDataPickDemo
//
//  Created by yhp on 15/9/16.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var datePicker1: UIDatePicker!

    @IBAction func dataPickerChanged(sender: UIDatePicker) {
//        var format = NSDateFormatter()
//        //设置时期格式
//        //format.dateStyle = NSDateFormatterStyle.ShortStyle
//        自定义日期格式
//        format.dateFormat = "yyyy年MM月dd日，HH小时mm分ss秒"
//        var dateStr = format.stringFromDate(sender.date)
//        NSLog(dateStr)
    }
    @IBAction func buttonClick(sender: UIButton) {
        datePicker1.countDownDuration -= 60
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

