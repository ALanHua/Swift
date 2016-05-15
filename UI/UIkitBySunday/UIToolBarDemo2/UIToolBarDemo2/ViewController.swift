//
//  ViewController.swift
//  UIToolBarDemo2
//
//  Created by yhp on 15/9/18.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var webView1: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView1.delegate = self
    }

    @IBAction func goBackClick(sender: UIBarButtonItem) {
        webView1.goBack()
    }
    
    @IBAction func loadClick(sender: UIBarButtonItem) {
        webView1.loadRequest(NSURLRequest(URL: NSURL(string: "http://\(textField1.text)")!))
    }
    @IBAction func reLoadClick(sender: UIBarButtonItem) {
        webView1.reload()
    }
    
    @IBAction func stopClick(sender: UIBarButtonItem) {
        webView1.stopLoading()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

