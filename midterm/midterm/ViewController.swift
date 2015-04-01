//
//  ViewController.swift
//  midterm project to create a calculator as found in iOS
//
//  Created by Anhad Arora on 26/03/2015.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//

//clear confusion regarding =/- sign, and function of Clear/All Clear Functions

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
        case "+/-":
            storeString = "\(0.0 - ((storeString as NSString).doubleValue))"
        default:
            println("Fix this outlet, something's broken: " + buttonText)
        }
        ioLabel.text = storeString
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

// kachra



//    func calculateAnswerWhenOperatorButtonPressed (storedString: Double, operatorSignAsSymbol: String) -> Double {
//        currentAnswer = currentAnswer "expression" storedString
//    }



//    func changeLabelOutput (output: String) {
//        ioLabel.text = output
//    }

//    currentAnswer = Double(buttonText.toInt()!)

//    if ioLabel.text == "0" {
//    ioLabel.text = theButton.titleLabel!.text
//    } else {
//    ioLabel.text = ioLabel!.text! + theButton.titleLabel!.text!
//    }





//    func randomStruff () {
//
//
//        switch operatorSign {
//        case "+":
//
//
//            add(firstOperand, n2: secondOperand)
//            println("this is current answer before addition: \(currentAnswer)")
//            println("this is current number before addition: \(currentNumber)")
//            currentAnswer = currentAnswer + currentNumber
//            numberHolder("0")
//            storeString = ""
//
//            println("this is current answer after addition: \(currentAnswer)")
//            println("this is current number after addition: \(currentNumber)")
//        case "−":
//            println("this is current answer before subtraction: \(currentAnswer)")
//            println("this is current number before subtraction: \(currentNumber)")
//            currentAnswer = currentNumber - currentAnswer
//            numberHolder("0")
//            storeString = ""
//            println("this is current answer after subtraction: \(currentAnswer)")
//            println("this is current number after subtraction: \(currentNumber)")
//
//        case "×":
//
//            currentAnswer = currentNumber * currentAnswer
//            numberHolder("0")
//            storeString = ""
//        case "÷":
//            operatorSign = "/"
//        default:
//            ioLabel.text = "Something's Wrong?!"
//        }
//        ioLabel.text = "\(currentAnswer)"


//        let lastIndex = countElements(storeValue) > 0 ? countElements(storeValue) - 1 : 0
//        var lastChar = Array(storeValue)[lastIndex]
//        storeValue = storeValue.removeCharsFromEnd(1)
//        println(storeValue)



//
//        if lastChar == "+" || lastChar == "−" || lastChar == "×" || lastChar == "÷" {
//
//            currentNumber = (storeValue as NSString).doubleValue
//
//
//        } else {
//            storeValue += "\(lastChar)"
//            currentNumber =  (storeValue as NSString).doubleValue
//
//        }

//        currentAnswer = calculateAnswerWhenOperatorButtonPressed(currentNumber, operatorSignAsSymbol: operatorSign)
//        storeValue = ""
//        currentAnswer = calculateAnswerWhenOperatorButtonPressed(storeValue)

//        println("answer input to answer holder now: \(currentAnswer)")
//        answerHolder("\(currentAnswer)")
//    }

//    func numberHolder (currentInput: String){
//        storeValue = currentInput
//        currentNumber = (storeValue as NSString).doubleValue
//        //        println("this is currentNumber in number holder function: \(currentNumber)")
//        //        ioLabel.text = storeValue
//    }
//    var currentAnswer: Double = 0.0
//
//    func add (n1: Double, n2: Double) -> Double {
//        var answer = n1 + n2
//        return answer
//    }


//    func operatorToFunction(opString: String) -> ((Double, Double) -> Double) {
//        switch opString {
//            case "+":
//                var add = { (a: Double, b: Double) in a + b }
//                let c = add(5,4)
//
//                return add
//        default:
//            break
////            dfsdfvsd
//
//
//        }
//
//    }



