
//
//  SixthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
    @IBOutlet weak var textHolder: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        var storeString = ""
        
        var items : [String] {
            get {
                let path = FifthViewController.pathToFile
                println(path)
                var rootList = NSArray(contentsOfURL: path!)
                return rootList as! [String]
            }
        }
        
        for item in items {
            storeString += item + " "
        }
        
        println(storeString)
        textHolder.text = storeString
    }
}
