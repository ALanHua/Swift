//
//  ViewController.swift
//  16-UITableView
//
//  Created by yhp on 2016/10/26.
//  Copyright © 2016年 YouHuaPei. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func loadView() {
        let tv = UITableView()
        tv.frame = UIScreen.main.bounds
        tv.dataSource = self
        tv.delegate = self
        view = tv
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - 懒加载
    lazy var dataList:[String] = {
        return ["a","b","c","d","d"]
    }()
    

}
// extension 相当于oc中的分类
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  tableView.dequeueReusableCell(withIdentifier: "customCell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "customCell")
        }
        cell?.textLabel?.text = dataList[indexPath.row]
        
        return cell!
    }
}

