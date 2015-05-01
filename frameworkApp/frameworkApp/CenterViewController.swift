//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import Parse

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    //  @IBOutlet weak private var imageView: UIImageView!
    //  @IBOutlet weak private var titleLabel: UILabel!
    //  @IBOutlet weak private var creatorLabel: UILabel!
    
    @IBOutlet weak var nextAlarmCountdownLabel: UILabel!
    
    @IBOutlet weak var nextAlarmLabel: UILabel!
    
    var currentTime = 0 //store current tim here in suitable format
    var today = "Monday" //store today's day
    
    var nextHour = 0
    var nextMinute = 0
    var nextSecond = 0
    var displayHour = 0
    var displayMinute = 0
    var displaySecond = 0
    
    
    var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func leftTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    @IBAction func rightTapped(sender: AnyObject) {
        delegate?.toggleRightPanel?()
    }
    
    
    func countDownToNextAlarm () {
        
        (nextHour, nextMinute, nextSecond) = findNextAlarm()
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        var date = NSDate()
        var calendar = NSCalendar.currentCalendar()
        var components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        var currentHour = components.hour
        var currentMinute = components.minute
        var currentSecond = components.second
        
        
        if currentHour > self.nextHour {
            displayHour = (24 - currentHour) + self.nextHour - 1//plus: account for day difference later
        } else {
            displayHour = self.nextHour - currentHour - 1
        }
        
        if currentMinute > self.nextMinute {
            displayMinute = (60 - currentMinute) + self.nextMinute - 1
        } else {
            displayMinute = self.nextMinute - currentMinute - 1
        }
        
        if currentSecond > self.nextSecond {
            displaySecond = (60 - currentSecond) + self.nextSecond
        } else {
            displaySecond = self.nextSecond - currentSecond
        }
        
        nextAlarmCountdownLabel.text = "\(displayHour):\(displayMinute):\(displaySecond)"
        nextAlarmLabel.text = "\(self.nextHour):\(self.nextMinute):\(self.nextSecond)"
    }
    
    func findNextAlarm () -> (Int, nextMinute: Int, nextSecond: Int) {
        
        var nextHour = 22
        var nextMinute = 0
        var nextSecond = 0
        
        return (nextHour, nextMinute, nextSecond)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        nextAlarmCountdownLabel.text = "\(displayHour):\(displayMinute):\(displaySecond)"
        countDownToNextAlarm ()
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}