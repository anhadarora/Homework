//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet weak var evenOddLabel: UILabel!
    var numberEntered: Int = inputNumber.text.toInt()
    
    @IBAction func calculateButton(sender: AnyObject) {
        
        if numberEntered % 2 == 0 {
            evenOddLabel.text = "is Even"
        } else { evenOddLabel.text = "is Not Even"
        }
    }
    
    
    /*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.
    
    */
}
