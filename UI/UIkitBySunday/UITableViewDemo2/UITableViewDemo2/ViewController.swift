//
//  ViewController.swift
//  UITableViewDemo2
//
//  Created by yhp on 15/9/22.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit
/**
**1, numberOfRowsInSection//节点行数量
**2, titleForHeaderInSection 节点头标题
**3, cellForRowAtIndexPath 根据索引位置返回单元格
**4, numberOfSectionsInTableView 节点数量
**5, sectionIndexTitlesForTableView 节点索引
**6, didSelectRowAtIndexPath 选中单元格
**7, canEditRowAtIndexPath
**8, UITableViewCellEditingStyle /delete insert样式
**9, titleForDeleteConfirmationButtonForRowAtIndexPath
**10, setEditing
**11, commitEditingStyle 提交编辑样式
**/

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView1: UITableView!
    
    var provinces = ["四川","云南","山东"]
    var cities = ["四川":["成都","绵阳","广元","成都","绵阳","广元"],"云南":["昆明","大理","丽江","昆明","大理","丽江"],"山东":["济南","青岛","威海","济南","青岛","威海","济南","青岛","威海"]]
    var markTag = 1
//移动
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//        1,先移动数据
        let proName = provinces [sourceIndexPath.section]
        let curCity = cities[proName]?[sourceIndexPath.row]
        cities[proName]?.removeAtIndex(sourceIndexPath.row)
        cities[proName]?.insert(curCity!, atIndex: destinationIndexPath.row)
        //2,然后移动tableViewCell
        tableView1.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
        
    }
//设置编辑状态
    @IBAction func editButtonClick(sender: UIBarButtonItem) {
        markTag = 1
        tableView1.setEditing(!tableView1.editing, animated: true)
        if tableView1.editing{
            sender.title = "Edit"
        }else{
            sender.title = "Done"
        }
    }
    
    @IBAction func insertButtonClick(sender: UIBarButtonItem){
        markTag = 2
        tableView1.setEditing(!tableView1.editing, animated: true)
        if tableView1.editing{
            sender.title = "Done"
        }else{
            sender.title = "Insert"
        }
    }
//返回编辑状态
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if markTag == 1{
            return UITableViewCellEditingStyle.Delete
        }else {
            return UITableViewCellEditingStyle.Insert
        }
    }
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "确认删除"
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //1，删除数组元素，2，删除单元格
        let prcName = provinces[indexPath.section]
        if markTag == 1{
            cities[prcName]?.removeAtIndex(indexPath.row)
            tableView1.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }else{
            //首先得到当前项的城市名字
            if let cityName = cities[prcName]?[indexPath.row]{
                cities[prcName]?.insert(cityName, atIndex: indexPath.row + 1)
                tableView1.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            }
        }
    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         tableView1.delegate = self
        tableView1.dataSource = self
    }
    //每个section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let provinceName = provinces[section]
        return cities[provinceName]!.count//返回每个section的行数
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "sundycell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
//        赋值
        //先得到section名称，省名称
        let proName = provinces[indexPath.section]
        //再根据当前section得到城市名称
        cell?.textLabel?.text = cities[proName]![indexPath.row]
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
//        
        return cell!
    }
    //几个section
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return provinces.count
    }
// 节点头
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return provinces[section]
    }
//节点索引
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return provinces
    }
//选中单元格
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("选中了的row:\(indexPath.row)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

