//
//  GetStartedViewController.swift
//  frameworkApp
//
//  Created by Anhad Arora on 5/11/15.
//  Copyright (c) 2015 Anhad Arora. All rights reserved.
//

import UIKit
import Parse

class GetStartedViewController: UIViewController {

    @IBAction func getStarted(sender: AnyObject) {
        let settings = NSUserDefaults.standardUserDefaults()
        
        if let token = settings.stringForKey("fbToken") {
            performSegueWithIdentifier("login", sender: nil)
        } else {
            PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile"], block: { (user, error) -> Void in
                if let user = user {
                    let token = FBSDKAccessToken.currentAccessToken().tokenString
                    settings.setObject(token, forKey: "fbToken")
                    self.performSegueWithIdentifier("login", sender: nil)
                } else {
                    println("user cancelled; didn't get a token")
                }
            })
        }
    }
}
