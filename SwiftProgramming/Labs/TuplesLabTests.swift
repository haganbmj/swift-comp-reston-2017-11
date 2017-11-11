//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest

class TuplesLabTests: XCTestCase
{
    func testTuplePositions() {
        let item = ("polos", 29.99, 2)
        let amount = item.1 * Double(item.2)
        print("\(item.2) \(item.0) at $\(item.1) = $\(amount)")
    }
    
    // Instructions: define global let constant named `polos`
    //
    func testTupleLabels() {
        let amount = polos.price * Double(polos.quantity)
        print("\(polos.quantity) \(polos.name) at $\(polos.price) = $\(amount)")
    }
    
    // Instructions: write a `calculatedAmount(item:)` function
    //
    func testTupleParameter() {
        let amount = calculatedAmount(item: polos)
        print("\(polos.quantity) \(polos.name) at $\(polos.price) = $\(amount)")
    }
    
    // Instructions: 
    // 1. write a `formatted(item:)` function
    // 2. define global let constant named `shirts`
    //
    func testTupleReturnValue() {
        // Position-based implementation
        let shirtA = formatted(item: shirts[0])
        print(shirtA.0)
        let shirtB = formatted(item: shirts[1])
        print(shirtB.0)
        print("total: $\(shirtA.1 + shirtB.1)")
        
        // Label-based implementation
        let (textA, amountA) = formatted(item: shirts[0])
        print(textA)
        let (textB, amountB) = formatted(item: shirts[1])
        print(textB)
        print("total: $\(amountA + amountB)")
    }
}
