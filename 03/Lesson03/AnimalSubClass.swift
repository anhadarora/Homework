//
//  AnimalSubClass.swift
//  Lesson03
//
//  Created by Anhad Arora on 10/03/2015.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class AnimalSubClass: Animal {

    override func prettyAnimalName() -> String {
        var customString = "This isn't self.name"
        return "Animal name: " + customString
    }
}
