import Foundation

final class QuickSort {

    private var nOperations: Int = 0
    func sort(_ array: [Int]) -> (sortedArray: [Int], numberOfOperations: Int)  {
        return (quickSort(array), nOperations)
    }

    private func quickSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        let randomPivotIndex = randomInteger(max: array.count - 1)
        let randomPivot = array[randomPivotIndex]
        let leftArray = left(array, pivotIndex: randomPivotIndex)
        let rightArray = right(array, pivotIndex: randomPivotIndex)
        let sortedLeftArray = quickSort(leftArray)
        let sortedRightArray = quickSort(rightArray)
        return sortedLeftArray + [randomPivot] + sortedRightArray
    }

    private func randomInteger(max: Int) -> Int {
        let random = Int(arc4random()) % max
        return random
    }

    private func left(_ array: [Int], pivotIndex: Int) -> [Int] {
        nOperations += array.count
        var array = array
        let pivot = array[pivotIndex]
        array.remove(at: pivotIndex)
        return array.filter {
            $0 < pivot
        }
    }

    private func right(_ array: [Int], pivotIndex: Int) -> [Int] {
        nOperations += array.count
        let pivot = array[pivotIndex]
        return array.filter {
            $0 > pivot
        }
    }
}
