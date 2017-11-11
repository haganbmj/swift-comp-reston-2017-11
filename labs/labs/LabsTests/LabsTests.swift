import XCTest
@testable import labs

class LabsTests: XCTestCase {

    func testFarenheitCelsius_1() {
        let celsius: Float = farenheitToCelsius(farenheit: 41)
        XCTAssertEqual(5, celsius)
        
        let farenheit: Float = celsiusToFarenheit(celsius: celsius)
        XCTAssertEqual(41, farenheit)
    }
    
    func testFarenheitCelsius_2() {
        let celsius: Float = farenheitToCelsius(farenheit: 50)
        XCTAssertEqual(10, celsius)
        
        let farenheit: Float = celsiusToFarenheit(celsius: celsius)
        XCTAssertEqual(50, farenheit)
    }
    
    func testFarenheitCelsius_3() {
        let celsius: Float = farenheitToCelsius(farenheit: 32)
        XCTAssertEqual(0, celsius)
        
        let farenheit: Float = celsiusToFarenheit(celsius: celsius)
        XCTAssertEqual(32, farenheit)
    }
}
