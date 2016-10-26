//
//  AppDelegate.swift
//  15-demo
//
//  Created by yhp on 2016/10/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
         // 1,创建window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.red
        // 2,创建控制器
         window?.rootViewController = ViewController()
         // 3,显示window
         window?.makeKeyAndVisible()
        return true
    }

}

