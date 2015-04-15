//
//  ThirdViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func nextPressed(sender: AnyObject) {
        textView!.text!.writeToURL(self.pathToFile!, atomically: false, encoding: NSUTF8StringEncoding, error: nil)
        println(textView!.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(animated: Bool) {
        nextPressed("k")
    }
    
    var pathToFile : NSURL? {
        get {
            let filename = "FlatFile.txt"
            
            let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as! NSURL
            
            let url = docDirectory.URLByAppendingPathComponent(filename)
            
            println(url)
            return url
        }
    }

}
