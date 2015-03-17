//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {


    var map = Dictionary<String, String>()
    //var map:NSMutableDictionary = [:]
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var mapTableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return map.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myMapCell") as UITableViewCell
        
        let person = map.keys.array[indexPath.row]
        
        cell.textLabel!.text = person
        cell.detailTextLabel!.text = map[person]
        
        return cell
    }


    func textFieldShouldReturn(textField2: UITextField) -> Bool {
        textField1.resignFirstResponder()
        return true
    }
    
    func addData () {
        map.keys.array.append(textField1!.text)
        map.values.array.append(textField2.text)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var notify = NSNotificationCenter.defaultCenter()
        
        notify.addObserver(self, selector: Selector("kbStuffHappened:"), name: UIKeyboardWillShowNotification, object: nil)
        
        notify.addObserver(self, selector: Selector("kbStuffHappened:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
//    func keyboardWillShow(notification : NSNotification){
//        textField1.backgroundColor = UIColor.blueColor()
//        textField2.backgroundColor = UIColor.blueColor()
//    }
//    
//    func keyboardWillHide(notification : NSNotification){
//        textField1.backgroundColor = UIColor.redColor()
//        textField2.backgroundColor = UIColor.redColor()
//    }
    
    func kbStuffHappened(notification : NSNotification){
        if notification.name == UIKeyboardWillHideNotification {
            textField1.backgroundColor = UIColor.redColor()
            textField2.backgroundColor = UIColor.redColor()
        } else if notification.name == UIKeyboardWillShowNotification {
            textField1.backgroundColor = UIColor.blueColor()
            textField2.backgroundColor = UIColor.blueColor()
        }
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
    }
}

