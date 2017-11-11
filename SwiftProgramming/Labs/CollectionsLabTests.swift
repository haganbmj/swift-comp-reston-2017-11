//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import XCTest
@testable import Shopping

//private let sizeKey = "size"
//private let priceKey = "price"
//private let quantityKey = "quantity"
//
//private let quart = 16
//private let quartOfMilkPrice = 1.29

class CollectionsLabTests: XCTestCase
{
//    func testGroceriesDictionary() {
//        var milk: [String: Any] = [:]
//        print(milk)
//        XCTAssertEqual(milk.count, 0)
//        
//        milk[sizeKey] = quart
//        milk[priceKey] = quartOfMilkPrice
//        milk[quantityKey] = 2
//        print(milk)
//        XCTAssertEqual(milk.count, 3)
//    }
    
    func testArray() {
        var items: [String] = []
        print(items)
        XCTAssertEqual(items.count, 0)

        items.append("Apple")
        items.append("Pear")
        print(items)
        XCTAssertEqual(items.count, 2)
        
        items[1] = "Orange"
        print(items)
    }
    
    func testLiteralArray() {
        let items = ["Apple", "Banana"]
        print(items)
        XCTAssertEqual(items.count, 2)
    }
    
    func testEnumerateArray() {
        let items = ["Apple", "Banana"]
        print(items)
        
        for item in items {
            print(item)
        }
        
        for (index, item) in items.enumerated() {
            print("item at index \(index) is \(item)")
        }
        
//        let names = [ "Jane", "Bill", "Jan" ]
//
//for (index, name) in names.enumerated() {
//    print("name \(index + 1) is \(name)")
//}
//// name 1 is Jane
//// name 2 is Bill
//// name 3 is Jan
        
    }
    
    func testDictionary() {
        var prices: [String: Double] = [:]
        prices["jeans"] = 49.99
        prices["t-shirt"] = 29.99
        print(prices)
    }
    
    func testEnumerateDictionary() {
        let prices = ["jeans": 49.99, "t-shirt": 29.99]
        print(prices)
        
        for (key, value) in prices {
            print("price of \(key) is \(value)")
        }
        // price of jeans is 49.990
        // price of t-shirt is 29.990
        
        for (itemName, price) in prices {
            print(String(format: "price of \(itemName) is %.3f", price))
        }
        
        print ("items:")
        for (key, _) in prices {
            print(key)
        }
        
        var sum = 0.0
        for (_, price) in prices {
            sum += price
        }
        print("sum is \(sum)")
    }
}
