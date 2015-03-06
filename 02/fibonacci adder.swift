//
//  fibonacci adder.swift
//  Lesson02
//
//  Created by Anhad Arora on 05/03/2015.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int) -> Int {
    
    if indexOfFibonacciNumber == 0 { return 1 }
    if indexOfFibonacciNumber == 1 { return 1 }
    
    return fibonacciNumberAtIndex(indexOfFibonacciNumber-2) + fibonacciNumberAtIndex(indexOfFibonacciNumber-1)
}
