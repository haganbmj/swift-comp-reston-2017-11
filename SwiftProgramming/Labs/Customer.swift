//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

struct Address: CustomStringConvertible {
    let street: String
    var street2: String?
    let city: String
    let state: String
    
    init(street: String, street2: String? = nil, city: String, state: String) {
        self.street = street
        self.street2 = street2
        self.city = city
        self.state = state
    }
    
    var fullStreet: String {
        guard let street2 = street2 else { return street }
        return "\(street), \(street2)"
    }
    var description: String {
        return "street: \(street), city: \(city), state: \(state)"
    }
}

class Customer: CustomStringConvertible
{
    var name: String?
    var address: Address?
//    lazy var cart: Cart? = Cart()
    
    init() { }
    init(name: String?, address: Address?) {
        self.name = name
        self.address = address
    }
    
    var description: String {
        let address: Any = self.address ?? "N/A"
        return "name: \(name ?? "N/A")\n"
            + "address: \(address)\n"
    }
}

extension Array where Element: Customer
{
    func customer(named name: String) -> Customer?
    {
        for customer in self {
            if let currName = customer.name, currName == name {
                return customer
            }
        }
        return nil
    }
}
