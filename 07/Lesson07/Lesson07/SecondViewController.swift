//
//  SecondViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let settings = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let name = settings.stringForKey("settings_name") as String!
        let slider = settings.stringForKey("settings_slider") as String!
        
        textView.text = "This is the String: \(name)\nThis is the Slider Value: \(slider)"

    }
}
