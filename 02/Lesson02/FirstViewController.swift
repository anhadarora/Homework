//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’

    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”

    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
    */
    
    @IBOutlet weak var label1: UILabel!

    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    var nameEntered : String = nameField.text!
    var ageEntered: Int = ageField.text.toInt()!
    
    @IBAction func buttonClicked(sender: AnyObject)
    {
        //todo1()
        //todo2(nameEntered, ageEntered)
        //todo3(ageEntered)
        todo4(ageEntered)
    }
    
    func todo1()
    {
        label1.text = "hello world"
    }
    
    func todo2(name: String, age: Int)
    {
        label1.text = "Hello \(name), you are \(age) years old!"
    }
    
    func todo3 (age: Int)
    {
          var linesToPrint: String = ""
        if age >= 21
        {
            linesToPrint += "You can drink \n"
        }
        if age >= 18
        {
            linesToPrint += "You can vote \n"
        }
        if age >= 16
        {
            linesToPrint += "You can drive"
        }
        
        label2.text = linesToPrint
    }

    func todo4 (age: Int)
    {
        var linesToPrint: String = ""
        if age >= 16 && age <= 18 {
            linesToPrint = "you can drive"
        } else if age >= 18 && age <= 21 {
            linesToPrint = "You can drive and vote"
        } else if age >= 21 {
            linesToPrint = "you can drive, vote and drink (but not at the same time!"
        } else {
            linesToPrint = "Go home kiddo"
        }
        
        label2.text = linesToPrint
    }
}











