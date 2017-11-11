//
//  TuplesTests.swift
//  labs
//
//  Created by Student on 11/11/17.
//  Copyright © 2017 About Objects Training. All rights reserved.
//

import XCTest
@testable import labs

// Step 1
class TuplesTest: XCTestCase {
    
    // Step 2
    func testTuplePositions() {
        let item = ("polos", Double: 29.99, 2)
        let amount = item.1 * Double(item.2)
        
        print("\(item) -> \(amount)")
    }
    
    // Step 3
    let polos = (name: "polos", price: 29.99, quantity: 2)
    
    func testTupleLabels() {
        let amount = polos.price * Double(polos.quantity)
        print("\(polos) -> \(amount)")
    }
    
    // Step 4
    func calculatedAmount(item: (String, Double, Int)) -> Double {
        return item.1 * Double(item.2)
    }
    
    func testTupleParameter() {
        let amount = calculatedAmount(item: polos)
        print("\(amount)")
    }
    
    // Step 5
    func formatted(item: (String, Double, Int)) -> (String, Double) {
        let amount = calculatedAmount(item: item)
        return ("\(item) -> \(amount)", amount)
    }
    
    let shirts = [
        ("shirtA", price: 19.99, quantity: 3),
        ("shirtB", price: 29.99, quantity: 2)
    ]
    
    func testTupleReturnValue() {
        var total: Double = 0
        for shirt in shirts {
            let (text, amount) = formatted(item: shirt)
            print(text)
            total += amount
        }
        
        print("Total: \(total)")
    }
}
