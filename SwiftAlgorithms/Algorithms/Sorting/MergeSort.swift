import Foundation

final class MergeSort: Sorting {

    private var nOperations: Int = 0

    func sort<T: Comparable>(_ array: [T]) -> (sortedArray: [T], numberOfOperations: Int) {
        nOperations = 0
        return (mergesort(array), nOperations)
    }

    private func mergesort<T: Comparable>(_ array: [T]) -> [T] {
        //print("mergesort on \(array)")
        guard array.count > 1 else {
            nOperations += 1
            return array
        }
        let middle = array.count / 2
        let leftArray = mergesort(Array(array[0..<middle]))
        let rightArray = mergesort(Array(array[middle..<array.count]))
        let sorted = merge(leftArray, rightArray)
        //print("Merge \(leftArray), \(rightArray) = \(sorted.sortedArray)")
        return sorted
    }

    private func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {

        var leftIndex = 0
        var rightIndex = 0
        var sorted = [T]()

        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            nOperations += 1
            let leftElement = leftArray[leftIndex]
            let rightElement = rightArray[rightIndex]
            if leftElement < rightElement {
                sorted.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                sorted.append(rightElement)
                rightIndex += 1
            } else {
                sorted.append(leftElement)
                leftIndex += 1
                sorted.append(rightElement)
                rightIndex += 1
            }
        }

        while leftIndex < leftArray.count {
            nOperations += 1
            let leftElement = leftArray[leftIndex]
            sorted.append(leftElement)
            leftIndex += 1
        }

        while rightIndex < rightArray.count {
            nOperations += 1
            let rightElement = rightArray[rightIndex]
            sorted.append(rightElement)
            rightIndex += 1
        }

        return sorted
    }
}
