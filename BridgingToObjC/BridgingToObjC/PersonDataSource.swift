//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class PersonDataSource: NSObject
{
    let spot = Pet(name: "Spot", type: .dog)
    
    lazy var persons: [Person] = [
        Person(firstName: "Fred", lastName: "Smith", pet: Pet(name: "Fido", type: .dog)),
        Person(firstName: "Jill", lastName: "Jones", pet: Pet(name: "Leo", type: .cat)),
        Person(firstName: "Jim", lastName: ""),
        Person(firstName: "", lastName: "Lee", pet: Pet(name: "Woofsie", type: .dog)),
        Person(firstName: "Barb", lastName: "Mack", pet: Pet(name: "Pookie", type: .cat)),
        Person(firstName: "Sue", lastName: "Yu")
    ]
    
    public func person(at indexPath: IndexPath) -> Person {
        return persons[indexPath.row]
    }
}


extension PersonDataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") else {
            fatalError("Reuse identifier must be specified in storyboard")
        }
        
        populate(cell: cell, at: indexPath)
        
        return cell
    }
}

extension PersonDataSource
{
    func populate(cell: UITableViewCell, at indexPath: IndexPath)
    {
        cell.textLabel?.text = person(at: indexPath).fullName
        cell.detailTextLabel?.text = "current mood:  \(person(at: indexPath).mood)"
    }
}
