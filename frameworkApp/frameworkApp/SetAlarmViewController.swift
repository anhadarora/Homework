//
//  SetAlarmViewController.swift
//  First Screen
//
//  Created by Anhad Arora on 4/27/15.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//

import UIKit

class SetAlarmViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func cancelAlarm(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        println("cancel")
    }
    
    @IBAction func saveAlarm(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        println("saved")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.datePickerMode = UIDatePickerMode.Time
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

