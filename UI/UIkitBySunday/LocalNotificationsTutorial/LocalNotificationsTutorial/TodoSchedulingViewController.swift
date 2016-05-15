//
//  TodoSchedulingViewController.swift
//  LocalNotificationsTutorial
//
//  Created by yhp on 15/10/9.
//  Copyright © 2015年 YouHuaPei. All rights reserved.
//

import UIKit

class TodoSchedulingViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func savePressed(sender: UIButton) {
        let todoItem = TodoItem(deadline: deadlinePicker.date, title: titleField.text!, UUID: NSUUID().UUIDString)
        TodoList.sharedTodoList.addItem(todoItem)
        self.navigationController?.popToRootViewControllerAnimated(true)//返回root view
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
