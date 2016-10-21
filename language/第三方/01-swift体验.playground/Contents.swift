//: Playground - noun: a place where people can play

import UIKit

// 创建对象
let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

 view.backgroundColor = UIColor.red
let btn = UIButton(type: UIButtonType.contactAdd)
btn.center = CGPoint(x: 50, y: 50)
view.addSubview(btn)
