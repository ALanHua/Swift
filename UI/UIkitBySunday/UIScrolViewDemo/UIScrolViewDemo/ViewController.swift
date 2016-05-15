//
//  ViewController.swift
//  UIScrolViewDemo
//
//  Created by yhp on 15/9/20.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var scrolView1: UIScrollView!
    @IBOutlet weak var pageControl1: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrolView1.backgroundColor = UIColor.redColor()
        scrolView1.contentSize = CGSize(width: 375 * 4, height: 667)//边框超过iPhone尺寸就好了
        scrolView1.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        scrolView1.contentOffset = CGPoint(x: 10, y: 10)
        scrolView1.indicatorStyle = UIScrollViewIndicatorStyle.White
        scrolView1.delegate = self
        
        var aView = UIView(frame: CGRect(x: 0*375, y: 0, width: 375, height: 667))
        aView.backgroundColor = UIColor.yellowColor()
        scrolView1.addSubview(aView)
        //2
        var bView = UIView(frame: CGRect(x: 1*375, y: 0, width: 375, height: 667))
        bView.backgroundColor = UIColor.grayColor()
        scrolView1.addSubview(bView)
        //3
        var cView = UIView(frame: CGRect(x: 2*375, y: 0, width: 375, height: 667))
        cView.backgroundColor = UIColor.greenColor()
        scrolView1.addSubview(cView)
        //4
        var dView = UIView(frame: CGRect(x: 3*375, y: 0, width: 375, height: 667))
        dView.backgroundColor = UIColor.blueColor()
        scrolView1.addSubview(dView)
        
        pageControl1.addTarget(self, action: "pageChanged", forControlEvents: UIControlEvents.ValueChanged)
    }
    func pageChanged(){
        var curPage = pageControl1.currentPage
        scrolView1.scrollRectToVisible(CGRect(x: curPage * 375, y: 0, width: 375, height: 667), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //pagecontrol 要跟着变动
        var curPage = scrolView1.contentOffset.x / 375
//        println(curPage)
        pageControl1.currentPage = Int(curPage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

