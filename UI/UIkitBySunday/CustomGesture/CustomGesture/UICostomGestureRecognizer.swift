//
//  UICostomGestureRecognizer.swift
//  CustomGesture
//
//  Created by yhp on 15/10/3.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class UICostomGestureRecognizer: UIGestureRecognizer {
    
    var leftTop = false
    var rightDown = false
    override init(target: AnyObject, action: Selector) {
        super.init(target: target, action: action)
    }
    
    override func touchesBegan(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        
    }
    override func touchesMoved(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        var myTouch = (touches as NSSet).anyObject() as? UITouch
        var myLocation = myTouch?.locationInView(self.view)
        if myLocation?.x < 10 && myLocation?.y < 10{
            leftTop = true
        }
        if (myLocation!.x + 10) > self.view?.bounds.width && (myLocation!.y + 10) > self.view?.bounds.height {
            rightDown = true
        }
        
        if rightDown && leftTop {
            self.state = UIGestureRecognizerState.Ended
        }
    }
    override func touchesEnded(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        self.reset()
    }
}
