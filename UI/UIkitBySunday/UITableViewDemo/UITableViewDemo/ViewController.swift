//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by yhp on 15/9/21.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//
/*
 * 1,写一个自定类
    新建一个cell类继承UITableViewCell
    定义属性
    重载构造函数
    添加姿势图
    使用这个类
 * 2，设计单元格
 * 3，建立一个lib
 */
import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView1: UITableView!
    var cities = ["成都","北京","上海","广州","深圳"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView1.delegate = self
        tableView1.dataSource = self
        
    }
//返回行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
//每一行的内容显示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellId = "sundycell"
        var cell: UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        var label1 = cell?.viewWithTag(1) as? UILabel
        var textField1 = cell?.viewWithTag(2) as? UITextField
        var switch1 = cell?.viewWithTag(3) as? UISwitch
        label1?.text = cities[indexPath.row]
        println(label1?.text)
        textField1?.placeholder = "hello "
        switch1?.on = true
        //肯定不是nil
        var cell2: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("sundycell2") as? UITableViewCell
         var label2 = cell2?.viewWithTag(1) as? UILabel
         label2?.text = "Sundy"
        //如果是单行
        if(indexPath.row % 2  == 0){
            return cell!
        }else{
            cell2?.backgroundColor = UIColor.greenColor()
            return cell2!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

