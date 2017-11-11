struct Point: CustomDebugStringConvertible {
    var x: Double
    var y: Double
    
    var debugDescription: String {
        return "x: \(x), y: \(y)"
    }
}

struct Size: CustomDebugStringConvertible {
    var width: Double
    var height: Double
    
    var debugDescription: String {
        return "width: \(width), height: \(height)"
    }
}

struct Rectangle: CustomDebugStringConvertible {
    var origin: Point
    var size: Size
    
    var x: Double { return origin.x }
    var y: Double { return origin.y }
    var width: Double { return size.width }
    var height: Double { return size.height }
    
    var debugDescription: String {
        return "\(origin), \(size)"
    }
    
    var area: Double { return width * height }
    
    var center: Point {
        return Point(
            x: (x + width) / 2.0,
            y: (y + height) / 2.0)
    }
    
    func offsetBy(dx: Double, dy: Double) -> Rectangle
    {
        let newOrigin = Point(x: x + dx, y: y + dy)
        
        return Rectangle(origin: newOrigin, size: size)
    }
}
