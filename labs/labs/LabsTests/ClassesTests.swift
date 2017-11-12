//
//  ClassesTests.swift
//  labsTests
//
//  Created by Student on 11/12/17.
//  Copyright © 2017 About Objects Training. All rights reserved.
//

import Foundation
import XCTest

class Person: Likeable, CustomDebugStringConvertible {
    var firstName: String
    var lastName: String
    var numberOfLikes = 0
    var friendId = 0
    var friends: [Friendable] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func like() {
        self.numberOfLikes += 1
    }
    
    func dislike() {
        if (self.numberOfLikes > 0) {
            self.numberOfLikes -= 1
        }
    }
    
    var debugDescription: String {
        return "debugDescription: \(firstName) \(lastName), numberOfLikes=\(numberOfLikes)"
    }
}

protocol Likeable: CustomDebugStringConvertible {
    var numberOfLikes: Int { get set }
    
    func like()
    func dislike()
    
    var debugDescription: String { get }
}

protocol Friendable {
    var friendId: Int { get }
    var friends: [Friendable] { get }
    
    func friend(friendable: Friendable)
    func unfriend(friendable: Friendable)
}

extension Person: Friendable {
    func friend(friendable: Friendable) {
        self.friends.append(friendable)
    }
    
    func unfriend(friendable: Friendable) {
        friends = friends.filter { friend in
            return friend.friendId != friendable.friendId
        }
        
        for (index, friend) in self.friends.enumerated() {
            if (friend.friendId == friendable.friendId) {
                self.friends.remove(at: index)
                return
            }
        }
        
        let index = friends.index { friendable.friendId == $0.friendId }
        guard index != nil else { return }
        friends.remove(at: index!)
    }
    
    func sort() {
        friends = friends.sorted(by: { (f0: Friendable, f1: Friendable) -> Bool in
            return f0.friendId < f1.friendId
        })

//        friends = friends.sorted(by: <)
    }
}

class ClassesTests: XCTestCase {
    
    func testPerson() {
        let person = Person(firstName: "Brendan", lastName: "Hagan")
        debugPrint(person)
    }
    
    func testPersonLikeable() {
        let person = Person(firstName: "Brendan", lastName: "Hagan")
        XCTAssertEqual(0, person.numberOfLikes)
        
        person.like()
        XCTAssertEqual(1, person.numberOfLikes)
        
        person.dislike()
        XCTAssertEqual(0, person.numberOfLikes)
        
        person.dislike()
        XCTAssertEqual(0, person.numberOfLikes)
    }
    
    func testPersonFriendable() {
        let person1 = Person(firstName: "Brendan", lastName: "Hagan")
        let person2 = Person(firstName: "Joe", lastName: "Joe")
        
        person1.friend(friendable: person2)
    }
}
