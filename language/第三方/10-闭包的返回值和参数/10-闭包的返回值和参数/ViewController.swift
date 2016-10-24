//
//  ViewController.swift
//  10-闭包的返回值和参数
//
//  Created by yhp on 2016/10/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sc = createScrollView(btnCount: { () -> Int in
            return 5
        }) { (index) -> UIView in
            let width = 80
            let btn = UIButton();
            // 3,设置UIButton的属性
            btn.backgroundColor = UIColor.blue
            btn.setTitle("标题\(index)", for: UIControlState.normal)
            btn.frame = CGRect(x: index*width, y: 0, width: width, height: 44)
            // 4,将UIButton 添加到UIScrollview上
            return btn
        }
        view.addSubview(sc)
    }
    // 1,定义一个方法创建UIScrollView,按钮通过闭包创建
    // 2,按钮也需要通过按钮创建
    func createScrollView(btnCount:()->Int,btmIndex:(_ index:Int)-> UIView) ->UIScrollView
    {
        // 1,创建scrollview
        let sc = UIScrollView(frame: CGRect(x: 0, y: 100, width: 375, height: 44))
        sc.backgroundColor = UIColor.red
        // 2，创建UIButton
        let count = btnCount()
        for i in 0..<count {
            let subView = btmIndex(i)
            sc.addSubview(subView)
            sc.contentSize = CGSize(width: CGFloat(count) * subView.bounds.width, height: 44)
        }
        return sc
    }
    
}


