//
//  ViewController.swift
//  UIWebViewDemo
//
//  Created by yhp on 15/9/17.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit
/*
 1,加载网页的方法，停止，上一步,下一步,goback,gofoword
 2,事件监听浏览器状态
*/
class ViewController: UIViewController,UIWebViewDelegate{


    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var webView1: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        webView1.loadHTMLString("<html><body><h1>你访问的是百度</h1></body></html>", baseURL: NSURL(string: "http://www.baidu.com"))
//        webView1.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.baidu.com")!))
        webView1.delegate = self
    }
    func webViewDidStartLoad(webView: UIWebView) {
        NSLog("Did start load")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog("Did finish load")
    }
    
    @IBAction func didEndOnExit(sender: UITextField) {
        textField1.resignFirstResponder()
    }
    @IBAction func buttonBackClick(sender: UIButton) {
        webView1.goBack()
    }
    
    @IBAction func buttonForwordClick(sender: UIButton) {
        webView1.goForward()
    }
    
    @IBAction func buttonGoClick(sender: UIButton) {
         webView1.loadRequest(NSURLRequest(URL: NSURL(string: "http://\(textField1.text)")!))
    }
    
    @IBAction func buttonReloadClick(sender: UIButton) {
        webView1.reload()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

