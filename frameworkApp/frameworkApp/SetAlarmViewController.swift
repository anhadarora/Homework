//
//  SetAlarmViewController.swift
//  First Screen
//
//  Created by Anhad Arora on 4/27/15.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//

import UIKit
import Parse

class SetAlarmViewController: UIViewController, UITableViewDataSource {
    
    var students = [PFObject]()
    var days = ["Monday": false,
                "Tuesday": false,
                "Wednesday": false,
                "Thursday": false,
                "Friday": false,
                "Saturday": false,
                "Sunday": false]
    
    

    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func cancelAlarm(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
        println("cancel")
    }
    
    @IBOutlet weak var daysTableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.keys.array.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("dayCell") as! UITableViewCell
        
        let day = days.keys.array[indexPath.row]
        println(day)
        cell.textLabel!.text = day
        
        return cell
    }
    
    //AM is true and PM is false
    func getHourAndMinute() -> (Int, Int, Bool) {
        var amPM = false
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH"
        var hour = dateFormatter.stringFromDate(timePicker.date).toInt()!
        if hour == 0 {
            hour = 12
            amPM = true
        } else if hour >= 12 {
            hour -= 12
            amPM = false
        } else {
            amPM = true
        }
        
        dateFormatter.dateFormat = "mm"
        var minute = dateFormatter.stringFromDate(timePicker.date).toInt()!
        println(hour)
        println(minute)
        println(amPM)
        return (hour, minute, amPM)
        
    }
    
    @IBAction func saveAlarm(sender: AnyObject) {
        
        var student = PFObject(className:"alarmData")
//        CenterViewController().hours[0] = (getHourAndMinute().0)
        student["hour"] = getHourAndMinute().0
        student["minute"] = getHourAndMinute().1
        student["AM_PM"] = getHourAndMinute().2
        student.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        
        
        self.dismissViewControllerAnimated(false, completion: nil)
        println("saved")
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.datePickerMode = UIDatePickerMode.Time
        getHourAndMinute()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

