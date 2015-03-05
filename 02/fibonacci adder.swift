//
//  fibonacci adder.swift
//  Lesson02
//
//  Created by Anhad Arora on 05/03/2015.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

func fibonacciNumberAtIndex(fib: Int) -> Int {
    
    if fib < 2 {
        return fib
    } else {
        return fibonacciNumberAtIndex(fib-2) + fibonacciNumberAtIndex(fib-1)
    }
}
