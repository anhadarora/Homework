//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var textHolder: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        let textFromFile: String = String(contentsOfURL: self.pathToFile!, encoding: NSUTF8StringEncoding, error: nil)!
        textHolder.text = textFromFile
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


//    if let path = NSBundle.mainBundle().pathForResource("FlatFile", ofType: "txt")
//    var text = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!
//    println(text)
