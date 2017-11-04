import Foundation

public extension Int {

    public var digitCount: Int {
        get {
            return numberOfDecimalDigits(self)
        }
    }
    
    private func numberOfDecimalDigits(_ n: Int) -> Int {
        if n < 10 { return 1 }
        return 1 + numberOfDecimalDigits( n / 10)
    }
}
