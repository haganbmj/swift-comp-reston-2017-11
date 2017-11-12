//
// Created by Student on 11/12/17.
// Copyright (c) 2017 About Objects Training. All rights reserved.
//

import Foundation
import XCTest

struct Address: CustomStringConvertible {
    var street: String
    var city: String
    var state: String
    var street2: String?

    init (street: String, city: String, state: String, street2: String? = nil) {
        self.street = street
        self.city = city
        self.state = state
        self.street2 = street2
    }

    var fullStreet: String {
        get {
            guard let street2 = street2 else { return street }
            return "\(street), \(street2)"
        }
    }

    var description: String {
        get { return "street=\(street), city=\(city), state=\(state), street2=\(street2)" }
    }
}

class Customer: CustomStringConvertible {
    var name: String
    var address: Address?

    init(name: String, address: Address? = nil) {
        self.name = name
        self.address = address
    }

    var description: String {
        get { return "name=\(name), address=\(address)" }
    }
}

// Extending Array to allow searching for Customers.
extension Array where Element: Customer {
    func customer(named: String) -> Customer? {
        let index = self.index { $0.name == named }
        guard let i = index else { return nil }
        return self[i]
    }

    // Example from instructor
    func customer2(named: String) -> Customer? {
        for customer in self {
            if customer.name == named {
                return customer
            }
        }

        return nil
    }
}

class OptionalsTests: XCTestCase {
    func testAddressFullStreet() {
        let address1 = Address(street: "street", city: "city", state: "state")

        XCTAssertEqual("street", address1.fullStreet)
        print(address1)
    }

    func testAddressFullStreet_address2() {
        let address2 = Address(street: "street", city: "city", state: "state", street2: "street2")

        XCTAssertEqual("street, street2", address2.fullStreet)
        print(address2)
    }

    func testCustomer() {
        let address1 = Address(street: "street", city: "city", state: "state")
        let customer = Customer(name: "Name", address: address1)

        XCTAssertEqual("Name", customer.name)
        print(customer)
    }

    func testCustomerArray() {
        let address1 = Address(street: "street", city: "city", state: "state")

        let customers = [
            Customer(name: "1", address: address1),
            Customer(name: "2", address: address1),
            Customer(name: "3", address: address1)
        ]

        let result = customers.customer(named: "2")
        XCTAssertEqual("2", result!.name)
    }
}
