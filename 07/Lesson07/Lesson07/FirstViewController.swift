//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: UIViewController {
    
    //TODO one: Make this text view print the values of test_string and test_number, stored in NSUserDefaults
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        Question for TA:
        //        I tried to use the following:
        //        let userDefaults = NSUserDefaults.standardUserDefaults()
        //        so that I didn't have to type out the long string again and again
        //        but it wouldn't compile because 'userDefaults' was of the type void
        //        what does that mean?
        
//        NSUserDefaults.standardUserDefaults().setObject("My Default String", forKey: "test_string")
        
        var testString = NSUserDefaults.standardUserDefaults().stringForKey("test_string")!
        
//        NSUserDefaults.standardUserDefaults().setDouble(0.0, forKey: "test_number")
        
        var testNumber = NSUserDefaults.standardUserDefaults().stringForKey("test_number")!
        
        textView.text = ("This is my test_string: \(testString)" + "\n" + "This is my test_number: \(testNumber)")
    }
}