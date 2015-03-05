//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var numbersToAdd: UITextField!
    
    @IBOutlet weak var addResult: UILabel!
    
    var numberEntered: Int = numbersToAdd.text.toInt()
    
    var cumulativeSum: Int = 0
    
    @IBAction func addPressed(sender: AnyObject) {
        cumulativeSum += numberEntered
        
        addResult.text = "\(cumulativeSum)"
        
    }
    
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
