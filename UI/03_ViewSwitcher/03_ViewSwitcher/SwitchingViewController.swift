//
//  SwitchingViewController.swift
//  03_ViewSwitcher
//
//  Created by yhp on 2017/12/14.
//  Copyright © 2017年 none. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {

    private var blueViewController:BlueViewController!
    private var yellowViewController:YellowViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
        blueViewController.view.frame = view.frame
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if blueViewController != nil
        && blueViewController!.view.superview == nil{
             blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil{
            yellowViewController = nil
        }
    }
    
    private func switchViewController(from fromVc: UIViewController?,to toVc: UIViewController?){
        if fromVc != nil {
            fromVc!.willMove(toParentViewController: nil);
            fromVc!.view.removeFromSuperview();
            fromVc!.removeFromParentViewController();
        }
        
        if toVc != nil {
            self.addChildViewController(toVc!)
            self.view.insertSubview(toVc!.view, at: 0)
            toVc!.didMove(toParentViewController: self)
        }
    }

    @IBAction func switchViews(_ sender: UIBarButtonItem) {
//      懒加载 view
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil{
            yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        }else if blueViewController?.view.superview == nil{
            if blueViewController == nil {
                 blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
//     添加动画
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
//     switch view controllers
        if blueViewController != nil
            && blueViewController.view.superview != nil{
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
        }else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController, to: blueViewController)
        }
        UIView.commitAnimations()
    }
    

}
