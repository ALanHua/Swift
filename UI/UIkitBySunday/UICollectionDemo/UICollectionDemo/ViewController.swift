//
//  ViewController.swift
//  UICollectionDemo
//
//  Created by yhp on 15/9/27.
//  Copyright (c) 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView1: UICollectionView!
    var images = ["1","2","3","4","5","6","7","8","9","1","2","3","4","5","6","7","8","9","1","2","3","4","5","6","7","8","9"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView1.dataSource = self
        collectionView1.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("sundycell", forIndexPath: indexPath) as? UICollectionViewCell
        var imageView = cell?.viewWithTag(1) as? UIImageView
        imageView?.image = UIImage(named: images[indexPath.row])
        return cell!
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    //layout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        if indexPath.row % 2 == 0{
            return CGSize(width: 200, height: 200)
        }else{
           return CGSize(width: 100 , height: 100)
        }
    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
//        return 5.0
//    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat{
//        return 5.0
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

