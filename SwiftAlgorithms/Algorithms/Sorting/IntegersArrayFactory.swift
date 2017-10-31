import Foundation

final class IntegersArrayFactory {

    static func makeRandomIntegersArray(size: Int = 100) -> [Int] {
        var array: [Int] = []
        for _ in 0..<size {
            array.append(Int(arc4random()) % size)
        }
        return array
    }

    static func makeLostNumbersArray() -> [Int] {
        return [42, 8, 16, 4, 15, 23]
    }
}
