import Foundation

final class BubbleSort: Sorting {

    func sort<T: Comparable>(_ array: [T]) -> (sortedArray: [T], numberOfOperations: Int) {
        var numberOfOperations = 0

        var array = array
        for i in 0...array.count - 1 {
            for j in i...array.count - 1 {
                numberOfOperations += 1
                if array[i] > array[j] {
                    array.swapAt(i, j)
                }
            }
        }
        return (array, numberOfOperations)
    }
}
