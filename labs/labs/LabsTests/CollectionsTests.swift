//
//  CollectionsTests.swift
//  labs
//
//  Created by Student on 11/11/17.
//  Copyright © 2017 About Objects Training. All rights reserved.
//

import XCTest
@testable import labs

class CollectionsTests: XCTestCase {
    
    func testArray() {
        var foodArray: [String] = []
        
        foodArray.append("Apple")
        foodArray.append("Pear")
        
        print(foodArray)
    }
    
    func testEnumerateArray() {
        let foodArray = ["Apple", "Banana"]
        
        for food in foodArray {
            print(food)
        }
        
        for (index, food) in foodArray.enumerated() {
            print("\(index): \(food)")
        }
    }
    
    func testEnumerateDictionary() {
        var dict: [String : Double] = [:]
        
        dict["jeans"] = 49.99
        dict["t-shirt"] = 29.99
        
        print(dict)
    }
    
    func testEnumerateDictionary2() {
        let dict = ["jeans": 49.99, "t-shirt": 29.99]
        
        // Print the keys and values
        for (key, value) in dict {
            print("key: \(key), value: \(value)")
        }
        
        // Print just the keys
        for (key, _) in dict {
            print(key)
        }
        
        // Print a sum of the values
        var total = 0.0
        for (_, value) in dict {
            total += value
        }
        
        print(total)
        
        // Print a sum of the values
        print(dict.values.reduce(0, +))
    }
}
