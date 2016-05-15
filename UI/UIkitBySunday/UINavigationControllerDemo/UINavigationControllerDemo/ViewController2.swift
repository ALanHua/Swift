//
//  ViewController2.swift
//  UINavigationControllerDemo
//
//  Created by yhp on 15/9/28.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var name = ""
    var delegate: SundyPathValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.view.backgroundColor = UIColor.yellowColor()
       self.navigationItem.title = "VC2"
       self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: UIBarButtonItemStyle.Done, target: self, action: "addClick")
       var label1 = UILabel(frame: CGRect(x: 10, y: 80, width: 130, height: 40))
        label1.text = name
        self.view.addSubview(label1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addClick(){
        delegate?.passValue("return sundy")
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
