//
//  StructTests.swift
//  labsTests
//
//  Created by Student on 11/12/17.
//  Copyright © 2017 About Objects Training. All rights reserved.
//

import Foundation
import XCTest

struct Point: Equatable {
    var x: Double
    var y: Double
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct Size: Equatable {
    var width: Double
    var height: Double
    
    static func ==(lhs: Size, rhs: Size) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }
}

struct Rectangle: Equatable {
    var origin: Point
    var size: Size
    
    var area: Double {
        get { return size.width * size.height }
    }
    
    var center: Point {
        get { return Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2)) }
    }
    
    func offset(dx: Double, dy: Double) -> Rectangle {
        let origin: Point = Point(x: self.origin.x + dx, y: self.origin.y + dy)
        return Rectangle(origin: origin, size: self.size)
    }
    
    static func ==(lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.origin == rhs.origin && lhs.size == rhs.size
    }
}

class StructTests: XCTestCase {
    let point = Point(x: 1, y: 2)
    let size = Size(width: 4, height: 3)
    
    func testRectangleArea() {
        let rectangle = Rectangle(origin: point, size: size)
        XCTAssertEqual(12, rectangle.area)
    }
    
    func testRectangleCenter() {
        let rectangle = Rectangle(origin: point, size: size)
        XCTAssertEqual(Point(x: 3, y: 3.5), rectangle.center)
    }
    
    func testRectangleOffset() {
        let rectangle = Rectangle(origin: point, size: size)
        let newRectangle = rectangle.offset(dx: 5, dy: 6)
        XCTAssertNotEqual(rectangle, newRectangle)
        XCTAssertEqual(Point(x: 6, y: 8), newRectangle.origin)
        XCTAssertEqual(rectangle.size, newRectangle.size)
    }
}
