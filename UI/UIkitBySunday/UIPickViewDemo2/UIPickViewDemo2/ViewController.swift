//
//  ViewController.swift
//  UIPickViewDemo2
//
//  Created by yhp on 15/9/17.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var pickView1: UIPickerView!
    
//    定义数据源
    let province = ["四川","云南","广东","广西"]
    let city = ["四川":["成都","绵阳","广元","宜宾"],"云南":["昆明","大理","丽江"],"广东":["广州","佛山","东莞"],"广西":["南宁","桂林"]]
//    保存所选城市名
    var selectValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        指定协议代理
        pickView1.delegate = self
        pickView1.dataSource = self
    }
//    设置列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
//    设置行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return province.count
        }else{
            if city[selectValue] != nil{
                return city[selectValue]!.count
            }else{
                return 0
            }
        }
    }
//    显示值（行）
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0{
            return province[row]
        }else{
            if city[selectValue] != nil{
                return city[selectValue]![row]
            }else{
                return "?"
            }
        }
    }
//    选择事件
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectValue = province[row]
            pickView1.reloadComponent(1)
            pickView1.selectRow(0, inComponent: 1, animated: true)//重新加载后回选择
        }else{
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

