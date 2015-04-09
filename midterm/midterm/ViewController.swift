//
//  ViewController.swift
//  midterm project to create a calculator as found in iOS
//
//  Created by Anhad Arora on 26/03/2015.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//

//Project ready for review

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ioLabel: UILabel!
    
    @IBAction func buttonTapped(theButton: UIButton) {
        numberFunction(theButton.titleLabel!.text!)
    }
    
    var storeString = "" //string variable to store intermediate value being used in the calculations
    var firstOperand = Double()
    var operatorSign = ""
    var secondOperand = Double()
    
    //function that inputs numbers, ie, 0...9 and decimal point "."
    func numberFunction (buttonText: String){
        switch buttonText {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            storeString = storeString + buttonText
        default:
            println("Fix this outlet, something's broken: " + buttonText)
        }
        ioLabel.text = storeString
    }
    
    //function to implement the negation key, "+/-"
    @IBAction func plusMinusTapped(sender: AnyObject) {
        firstOperand = 0.0
        operatorSign = "−"
        secondOperand = (ioLabel.text! as NSString).doubleValue
        firstOperand = calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign)
        storeString = ("\(firstOperand)")
        ioLabel.text = storeString
        operatorSign = ""
    }
    
    //function that inputs operator keys and simultneously computes the answer as the key is pressed
    @IBAction func operatorButtonTapped(operatorButton: UIButton) {
        if operatorSign == "" {
            firstOperand = (storeString as NSString).doubleValue
            operatorSign = operatorButton.titleLabel!.text!
            storeString = ""
        } else {
            secondOperand = (storeString as NSString).doubleValue
            if secondOperand == 0 && operatorSign == "÷" {
                allClear(secondOperand)
            } else {
                firstOperand = calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign)
                operatorSign = operatorButton.titleLabel!.text!
                storeString = ""
            }
        }
        if firstOperand == 0.0 && operatorSign == "" && secondOperand == 0.0 {
            ioLabel.text = "that was dumb 👏🏻"
        } else {
            ioLabel.text = "\(firstOperand)"
        }
    }
    
    //universal function that calculates answer whereever required
    func calculateAnswer (first: Double, second: Double, opSymbol: String) -> Double {
        var answer = Double()
        switch opSymbol {
        case "+":
            answer = first + second
        case "−":
            answer = first - second
        case "×":
            answer = first * second
        case "÷":
            answer = first / second
        default:
            ioLabel.text = "Something's Wrong?!"
        }
        return answer
    }
    
    //function that computes the final answer as a result of successive input numbers and operators
    @IBAction func equalsButtonTapped(sender: AnyObject) {
        secondOperand = (storeString as NSString).doubleValue
        
        if ioLabel.text == "0" && operatorSign != "÷" {
            ioLabel.text = "0.0"
        } else if secondOperand == 0 && operatorSign == "÷" {
            allClear(secondOperand)
            ioLabel.text = "that was dumb 👏🏻"
        } else if operatorSign == "" {
            ioLabel.text = storeString
        } else {
            var finalAnswer = calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign)
            ioLabel.text = "\(finalAnswer)"
        }
    }
    
    //function that calculates the second number as a percentage of the first number
    //this function first shows the user a percentage of the first number,
    //then performs arithmetic operation on the first number and outputs the result on pressing the "=" button
    @IBAction func percentageButton(sender: AnyObject) {
        secondOperand = (storeString as NSString).doubleValue
        secondOperand = (secondOperand/100) * firstOperand
        ioLabel.text = "\(secondOperand)"
        storeString = "\(secondOperand)"
    }
    
    //this function sets all variables to an initial value so new computation can take place
    @IBAction func allClear(sender: AnyObject) {
        ioLabel.text = "0"
        storeString = ""
        firstOperand = 0.0
        operatorSign = ""
        secondOperand = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
