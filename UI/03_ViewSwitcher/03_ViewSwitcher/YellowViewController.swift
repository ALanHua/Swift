//
//  YellowViewController.swift
//  03_ViewSwitcher
//
//  Created by yhp on 2017/12/15.
//  Copyright © 2017年 none. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func yellowButtonPressed(_ sender:UIButton){
        let alert = UIAlertController(title: "Yellow View Controller Pressed", message: "You pressed button on the yellow view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I did", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil);
    }

}
