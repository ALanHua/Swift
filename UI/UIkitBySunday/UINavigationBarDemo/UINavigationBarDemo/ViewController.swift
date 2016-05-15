//
//  ViewController.swift
//  UINavigationBarDemo
//
//  Created by yhp on 15/9/28.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit
/*
1,在navigationBar加上button
2，点击button,入栈
3，

navigationBar
1,title
2,prompt
3,leftBarButtonItem
4,rightBarButtonItem
5,backBarButtonItem
*/
class ViewController: UIViewController {

    @IBOutlet weak var navBar1: UINavigationBar!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addClick(sender: UIBarButtonItem) {
        addOneMore()
        
    }
    func reduceOneMore(){
        count--
//        弹栈
        navBar1.popNavigationItemAnimated(true)
    }
    func addOneMore(){
        count++
        var item = UINavigationItem(title: "\(count)")
        item.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addOneMore")
        item.backBarButtonItem =  UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Done, target: self, action: "reduceOneMore")
//        压栈
        navBar1.pushNavigationItem(item, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

