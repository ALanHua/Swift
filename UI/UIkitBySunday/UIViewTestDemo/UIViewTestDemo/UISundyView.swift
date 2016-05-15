//
//  UISundyView.swift
//  UIViewTestDemo
//
//  Created by yhp on 15/10/2.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class UISundyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("Touch began")
    }
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("Touch move")
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("Touch ended")
    }
}
