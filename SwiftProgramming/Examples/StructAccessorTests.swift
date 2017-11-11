//
//  StructAccessorTests.swift
//  SwiftProgramming
//
//  Created by Jonathan Lehr on 2/14/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import XCTest

@testable import SwiftProgramming

class Shape {
    var position = Point(x: 0, y: 0)
}

class StructAccessorTests: XCTestCase
{
    func testStructAccessors() {
        let shape1 = Shape()
        var point1 = shape1.position
        point1.x = 12.0
        print("\(point1), \(shape1.position)")
        withUnsafePointer(to: &point1) { print($0) }
        withUnsafePointer(to: &shape1.position) { print($0) }
        withUnsafePointer(to: &shape1.position.y) { print($0) }
        
        shape1.position.x += 3
        print("\(point1), \(shape1.position)")
        withUnsafePointer(to: &shape1.position) {
            print($0)
        }
        withUnsafePointer(to: &shape1.position.x) {
            print($0)
        }
    }
}
