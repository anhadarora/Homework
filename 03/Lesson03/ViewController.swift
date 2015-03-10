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
    
    /*
        TODO four: Hook up the button on the home screen to push ArrayTableViewController into view (via the navigation controller) when tapped. Do this by triggering a segue from this view controller. The method you are looking for is performSegueWithIdentifier. Find the identifier from the storyboard.
    */
    @IBAction func displayTableView(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("ArrayTableViewController") as UIViewController
        presentViewController(destination, animated: true, completion: nil)
        
    }

}

// unused code, kept for future referencing

//    dismissViewControllerAnimated(true, completion: nil)

//    @IBAction func displayTableView(sender: AnyObject) {
//        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//        let destination = storyboard.instantiateViewControllerWithIdentifier("ArrayTableViewController") as UIViewController
//        presentViewController(destination, animated: true, completion: nil)

//        performSegueWithIdentifier(<#identifier: String?#>, sender: <#AnyObject?#>)

//        (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated
//    }