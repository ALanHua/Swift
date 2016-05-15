//
//  ViewController.swift
//  UIImageDemo
//
//  Created by yhp on 15/9/15.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        image1.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://www.maiziedu.com/uploads/course/2015/07/1.2oc%E8%AF%AD%E6%B3%95%E8%AF%BE%E7%A8%8B.jpg")!)!)
        image1.animationImages = [UIImage(named: "fog")!,UIImage(named: "hennessy")!,UIImage(named: "Icon-60-1")!,UIImage(named: "Icon-60")!]
        image1.animationRepeatCount = 100
        image1.animationDuration = 1
        image1 .startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

