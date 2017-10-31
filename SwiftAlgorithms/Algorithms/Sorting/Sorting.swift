import Foundation

protocol Sorting {
    func sort<T: Comparable>(_ array: [T]) -> (sortedArray: [T], numberOfOperations: Int)
}
