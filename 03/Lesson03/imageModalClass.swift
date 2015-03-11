//
//  imageModalClass.swift
//  Lesson03
//
//  Created by Anhad Arora on 09/03/2015.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class imageModalClass: UIViewController {
    @IBAction func dismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
