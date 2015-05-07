//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

//var dict : [String : String] = [:]
    var map = [String:String]()
    //Dictionary<String, String>()
    //var map:NSMutableDictionary = [:]
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var mapTableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return map.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myMapCell") as! UITableViewCell
        
        let person = map.keys.array[indexPath.row]
        cell.textLabel?.text = person
        cell.detailTextLabel?.text = map[person]
        
        return cell
    }

    func textFieldShouldReturn(textField2: UITextField) -> Bool {
        addData ()
        textField1.resignFirstResponder()
        return true
    }
    
    func addData () {
        map["\(textField1!.text)"] = textField2?.text
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var notify = NSNotificationCenter.defaultCenter()
        
        notify.addObserver(self, selector: Selector("kbStuffHappened:"), name: UIKeyboardWillShowNotification, object: nil)
        
        notify.addObserver(self, selector: Selector("kbStuffHappened:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func kbStuffHappened(notification : NSNotification){
        if notification.name == UIKeyboardWillHideNotification {
            textField1.backgroundColor = UIColor.redColor()
            textField2.backgroundColor = UIColor.redColor()
        } else if notification.name == UIKeyboardWillShowNotification {
            textField1.backgroundColor = UIColor.blueColor()
            textField2.backgroundColor = UIColor.blueColor()
        }
    }
}

