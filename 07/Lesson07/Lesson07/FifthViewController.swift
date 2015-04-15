//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet weak var textHolder: UITextView!
    
    @IBAction func nextPressed(sender: AnyObject) {
        var textString = textHolder!.text!
        var arrayVariable = split(textString) {$0 == " "}
        println(arrayVariable)
        (arrayVariable as NSArray).writeToURL(FifthViewController.pathToFile!, atomically: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        nextPressed("k")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textHolder.text = ""
        // Do any additional setup after loading the view.
    }
    
    class var pathToFile : NSURL? {
        get {
            let filename = "ArrayFile.plist"
            
            let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as! NSURL
            
            let url = docDirectory.URLByAppendingPathComponent(filename)
            
            println(url)
            return url
        }
    }
}

//        alternate method:
//
//        var storeString = ""
//
//        for character in textString {
//
//            if character != " " {
//                storeString += "\(character)"
//            } else {
//                self.arrayVariable.append(storeString)
//                storeString = ""
//            }
//        }