//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

// MARK: Added for TuplesLabTests

let polos = (name: "polos", price: 29.99, quantity: 3)

func calculatedAmount(item: (_: String, price: Double, quantity: Int)) -> Double {
    return item.price * Double(item.quantity)
}

func amount(item: LineItem) -> Double {
    return item.price * Double(item.quantity)
}

typealias LineItem = (name: String, price: Double, quantity: Int)

func formatted(item: LineItem) -> (String, Double) {
    let amount = calculatedAmount(item: item)
    let text = "\(item.quantity) \(item.name) at $\(item.price) = $\(amount)"
    return (text, amount)
}


// MARK: Added for ControlFlowLabTests

let shirts = [
    (name: "buttondowns", price: 79.99, quantity: 3),
    (name: "polos", price: 49.99, quantity: 2),
    (name: "tees", price: 34.95, quantity: 6)
]

func formatted(items: [LineItem]) -> [(String, Double)] {
    var formattedItems: [(String, Double)] = []
    for item in items {
        formattedItems.append(formatted(item: item))
    }
    return formattedItems
}

func discount(shirt: LineItem) -> Double {
    guard case let amount = calculatedAmount(item: shirt), amount > 99 else {
        return 5
    }
    return fmin(amount/20, 30)
}


