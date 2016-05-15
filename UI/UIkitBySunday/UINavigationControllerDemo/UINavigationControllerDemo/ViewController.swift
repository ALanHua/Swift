//
//  ViewController.swift
//  UINavigationControllerDemo
//
//  Created by yhp on 15/9/28.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SundyPathValue {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        self.navigationItem.title = "VC1"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: UIBarButtonItemStyle.Done, target: self, action: "addClick")
        
    }
    func addClick(){
        var vc2 = ViewController2()
        vc2.name = "sundy"
        vc2.delegate = self
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    func passValue(value: String){
        var label2 = UILabel(frame: CGRect(x: 10, y: 80, width: 120, height: 40))
        label2.text = value
        self.view.addSubview(label2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

