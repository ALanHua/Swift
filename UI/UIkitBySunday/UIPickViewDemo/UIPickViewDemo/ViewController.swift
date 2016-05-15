//
//  ViewController.swift
//  UIPickViewDemo
//
//  Created by yhp on 15/9/16.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit
/*数据源使用用法
    1,定义数据源(数组或者plist或者文本)
    2,指定行列数
    3,显示
*/
class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {

    var people = ["Sundy","YHP","YSW","YL"]
    var friends = ["Cat","Dog","Pig","Rat"]
    @IBOutlet weak var pickView1: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickView1.delegate = self
        pickView1.dataSource = self
        pickView1.backgroundColor = UIColor.redColor()
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2 //列数
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return people.count //行数
        }else{
            return friends.count
        }
//        return people.count //行数
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        //row 行，component 列
        if component == 0{
            return people[row]
        }else{
            return friends[row]
        }
//        return people[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NSLog(people[row])
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

