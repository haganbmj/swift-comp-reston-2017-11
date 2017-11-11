import Foundation

func farenheitToCelsius(farenheit: Float) -> Float {
    return (farenheit - 32) * 5/9;
}

func celsiusToFarenheit(celsius: Float) -> Float {
    return (celsius * 9/5) + 32;
}
