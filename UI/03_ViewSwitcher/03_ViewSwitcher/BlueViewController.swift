//
//  BlueViewController.swift
//  03_ViewSwitcher
//
//  Created by yhp on 2017/12/15.
//  Copyright © 2017年 none. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blueButtonPressed(_ sender:UIButton){
        let alert = UIAlertController(title: "Blue View Controller Pressed", message: "You pressed button on the blue view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I did", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil);
    }


}
