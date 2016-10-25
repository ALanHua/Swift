//
//  ViewController.swift
//  11-闭包和循环引用
//
//  Created by yhp on 2016/10/25.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // swift 类中定义一个属性，必须初始化
    // 如果暂时不想初始化，那么可以在后面加个？
    var finished: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weak var weakSelf = self
       loadData { 
            print("回到主线程")
            // 在闭包中必须写self
            weakSelf!.view.backgroundColor = UIColor.red
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(finished:@escaping ()->()) {
        print("执行耗时操作")
        self.finished = finished
        finished()
    }
    
    deinit {
        print("滚")
    }

}

