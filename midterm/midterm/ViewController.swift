//
//  ViewController.swift
//  midterm
//
//  Created by Anhad Arora on 26/03/2015.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//



//clear confusion regarding percentage, and function of Clear/All Clear Functions


import UIKit

class ViewController: UIViewController {
    
    var storeValue: String = ""
//    var currentNumber = Double()
    @IBOutlet weak var ioLabel: UILabel!
    
    //action for number buttons, dot, plus/minus, and AC
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
    
        println("this is the number stored rn " + storeString)
        ioLabel.text = storeString
//        numberHolder(storeString == "" ? "0" : storeString)
//        changeLabelOutput(storageString)
        
    }
    
    var firstOperand = Double()
    var operatorSign = ""
    var secondOperand = Double()
    @IBAction func operatorButtonTapped(operatorButton: UIButton) {
//        firstOperand = (storeString as NSString).doubleValue
        if operatorSign == "" {
            firstOperand = (storeString as NSString).doubleValue
            operatorSign = operatorButton.titleLabel!.text!
            storeString = ""
        } else {
            secondOperand = (storeString as NSString).doubleValue
            firstOperand = calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign)
            operatorSign = operatorButton.titleLabel!.text!
            storeString = ""
        }
        ioLabel.text = "\(firstOperand)"
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
//            case "÷":
//                answer = (second != 0.0) ? first / second : Double("∞")
            default:
                ioLabel.text = "Something's Wrong?!"
        }
        return answer
    }
    

    
    
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
    
    @IBAction func equalsButtonTapped(sender: AnyObject) {
//            operatorButtonTapped()
        secondOperand = (storeString as NSString).doubleValue
        ioLabel.text = "\(calculateAnswer(firstOperand, second: secondOperand, opSymbol: operatorSign))"
//        var equalsValue = (storeValue as NSString).doubleValue
//        //println((storeValue as NSString).doubleValue)
//        ioLabel.text = "\(equalsValue)"
//        
//        
//        let lastIndex = countElements(storeValue) - 1
//        var lastChar = Array(storeValue)[lastIndex]
//        storeValue = storeValue.removeCharsFromEnd(1)
//                if lastChar == "+" || lastChar == "−" || lastChar == "×" || lastChar == "÷" {
//            
//        } else {
//            storeValue += "\(lastChar)"
//        }
//
////        println(storeValue)
//
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension String {
    
    func removeCharsFromEnd(count:Int) -> String {
        let stringLength = countElements(self)
        
        let substringIndex = (stringLength < count) ? 0 : stringLength - count
        
        return self.substringToIndex(advance(self.startIndex, substringIndex))
    }
}

