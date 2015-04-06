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
    
    var storeString = ""
    func numberFunction (buttonText: String){
        
        switch buttonText {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            storeString = storeString + buttonText
        default:
            println("Fix this outlet, something's broken: " + buttonText)
        }
        ioLabel.text = storeString
    }
    
    @IBAction func plusMinusTapped(sender: AnyObject) {
        firstOperand = 0.0
        operatorSign = "−"
        secondOperand = (ioLabel.text! as NSString).doubleValue
        firstOperand = calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign)
        
        
        
        storeString = ("\(firstOperand)")
        ioLabel.text = storeString
        operatorSign = ""
        secondOperand = 0.0

    }
    
    
    var firstOperand = Double()
    var operatorSign = ""
    var secondOperand = Double()
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
            ioLabel.text = "that was dumb 👏"
        } else {
            ioLabel.text = "\(firstOperand)"
        }
    }
    
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
    
    @IBAction func equalsButtonTapped(sender: AnyObject) {
        secondOperand = (storeString as NSString).doubleValue
        var finalAnswer = calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign)
        if secondOperand == 0 && operatorSign == "÷" {
            allClear(secondOperand)
            ioLabel.text = "that was dumb 👏"
        } else {
            ioLabel.text = "\(finalAnswer)"
        }
    }
    
    @IBAction func percentageButton(sender: AnyObject) {
        secondOperand = (storeString as NSString).doubleValue
        secondOperand = (secondOperand/100) * firstOperand
        ioLabel.text = "\(secondOperand)"
        storeString = "\(secondOperand)"
    }
    
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
