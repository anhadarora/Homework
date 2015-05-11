import UIKit
import Parse

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
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
    
    var startDate: NSDate?
    //    var futureTime: NSDate?
    var duration:NSTimeInterval?
    func subtractTime() {
        
        let date: NSDate = NSDate()
        let cal: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        let futureTime: NSDate = cal.dateBySettingHour(nextHour, minute: nextMinute, second: nextSecond, ofDate: date, options: NSCalendarOptions())!
        
        startDate = NSDate()
        
        var calendar:NSCalendar = NSCalendar.currentCalendar()
        
        let dayComponents = calendar.components(.CalendarUnitDay,
            fromDate: startDate!,
            toDate: futureTime,
            options: nil)
        let dayDuration = dayComponents.day
        
        duration = futureTime.timeIntervalSinceDate(startDate!)
        
        nextAlarmCountdownLabel.text = "\(dayDuration)day/s \(dateStringFromTimeInterval(duration!))"
        nextAlarmLabel.text = "\(self.nextHour):\(self.nextMinute):\(self.nextSecond)"
    }
    var dateFormatter = NSDateFormatter()
    func dateStringFromTimeInterval(timeInterval: NSTimeInterval) -> String {
        //Formatting the time to fit our style
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        //      timeLabel.text = dateFormatter.stringFromDate(currentTime!) //This is how you make a clock for the current time.
        
        //We have to create a new time zone for our dateformatter to UTC that will change our current time zone down to a zero because the UTC time zone is zero difference and cental time zone is +18! so usually stop timers are set to UTC so that the time zone is zero! :D
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        
        //We are shifting the date back in time where the time began for computer 1970 when UTC standard is approved
        var date = NSDate(timeIntervalSince1970: timeInterval)
        
        return dateFormatter.stringFromDate(date)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func findNextAlarm () -> (Int, nextMinute: Int, nextSecond: Int) {
        
        var nextHour = 1
        var nextMinute = 11
        var nextSecond = 0
        
        return (nextHour, nextMinute, nextSecond)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(NSUserDefaults.standardUserDefaults().stringForKey("fbToken"))
        
        if NSUserDefaults.standardUserDefaults().stringForKey("fbToken") == nil {
            //            centerViewController.performSegueWithIdentifier("getToken", sender: nil)
            
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let destination = storyboard.instantiateViewControllerWithIdentifier("getStartedVC") as! UIViewController
            presentViewController(destination, animated: true, completion: nil)
        }

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
//        dateLabel.text = "\(dayDuration)day/s"


//
//
//
//
//        var date = NSDate()
//        var calendar = NSCalendar.currentCalendar()
//        var components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
//        var currentHour = components.hour
//        var currentMinute = components.minute
//        var currentSecond = components.second
//
////        displayMinute = (60 - currentMinute) + self.nextMinute
//
//        if currentHour > self.nextHour {
//            displayHour = (24 - currentHour) + self.nextHour//plus: account for day difference later
//        } else if currentHour == self.nextHour {
//            displayHour = self.nextHour - currentHour
//        } else {
//            displayHour = self.nextHour - currentHour - 1
//        }
//
//        if currentMinute >  self.nextMinute {
//            displayMinute = (60 - currentMinute) + self.nextMinute
//        } else if currentMinute == self.nextMinute {
//            displayMinute = self.nextMinute - currentMinute
//        } else {
//            displayMinute = self.nextMinute - currentMinute - 1
//        }
//
//        if currentSecond > self.nextSecond {
//            displaySecond = (60 - currentSecond) + self.nextSecond
//        } else if currentSecond == self.nextSecond {
//            displaySecond = self.nextSecond - currentSecond
//        } else if currentSecond > self.nextSecond {
//            displaySecond = self.nextSecond - currentSecond - 1
//        }
//
//        nextAlarmCountdownLabel.text = "\(displayHour):\(displayMinute):\(displaySecond)"



//    var alarmProperties = [String:PhotoProperties]()
//    var imageName = "Unknown"
//
//    class AlarmProperties {
//        var hour : Int
//        var minute : Int
//        var second = 0
//        var amPM : Bool?
//        var onOff : Bool = false
//
//        init(hour : Int, minute : Int, score : Float){
//            self.rating = rating
//            self.comment = comment
//            self.score = score
//        }
//    }




/*
references:
1: hours
2: minute
3: amPM
4: onOFF
5: array for days
6 - 10: friend 1 to 5
*/
//    var Days = Array(count:7, repeatedValue:[Bool]())
//    var alarmProperties = [[Int]](count: 1, repeatedValue: [Int](count: 1, repeatedValue: [Bool](count: 1, repeatedValue: [Bool](count: 1, repeatedValue: [Days](count: 1, repeatedValue: 0)))))
//    var alarmProperties = [Int][Int][Bool][Bool][Days]()

//    var alarmProperties = Array(count:10, repeatedValue:[AnyObject]())

    