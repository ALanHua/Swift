//
//  ViewController.swift
//  09-swift闭包
//
//  Created by yhp on 2016/10/24.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         闭包格式
         {
            () -> ()
            in // 区分形参返回值和执行代码
            需要执行的代码
         }         
         */
         /*
         闭包的几种格式
         1，将闭包通过实参传递给函数
         2，如果闭包是函数的最后一个参数，那么闭包可以写在()后面
         3,如果函数只接受一个参数，且这个参数是闭包，()可以省略
         */
        
        loadData (num: 10,finished: {
            print("执行回调")
        })
        
        loadData(num: 10) { 
            print("执行回调")
        }
        say (finished: {
           print("say")
        })
        say {
          print("say 2")
        }
        
        /*
         闭包的简写
         如果闭包没有参数没有返回值 那么in 之前的东西都可以删除包括in
        */
        
        
    }
    
    func say(finished:()->()){
        
    }
    
    func loadData(num:Int,finished:()->() ){
        print("执行耗时操作")
        // 回调
        finished()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.global().async {
            print("执行耗时操作")
            DispatchQueue.main.async {
                print("回到主线程")
            }
        }
    }

}

