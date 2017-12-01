//
//  ViewController.swift
//  01_ButtonFun
//
//  Created by yhp on 2017/12/1.
//  Copyright © 2017年 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let tittle = sender.title(for: .selected)!
        let text = "\(tittle) button pressd"
        let styleTest = NSMutableAttributedString(string: text)
        let attributs = [
            NSAttributedStringKey.font:
            UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        let nameRange = (text as NSString).range(of: tittle)
        
        styleTest.setAttributes(attributs, range: nameRange)
        
        statusLabel.attributedText = styleTest
    }
}

