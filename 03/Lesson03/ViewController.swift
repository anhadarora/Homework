//
//  ViewController.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func swipeRight(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("imageModal") as UIViewController
        presentViewController(destination, animated: true, completion: nil)
    }
        
    @IBAction func swipeLeft(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("imageModal") as UIViewController
        presentViewController(destination, animated: true, completion: nil)
    }

    @IBOutlet weak var displayTableViewButtonOutlet: UIButton!
    @IBAction func displayTableView(sender: AnyObject) {
        self.performSegueWithIdentifier("show", sender: displayTableViewButtonOutlet)
        
    }
}