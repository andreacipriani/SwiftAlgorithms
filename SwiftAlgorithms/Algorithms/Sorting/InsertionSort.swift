import Foundation

final class InsertionSort: Sorting {
    
    func sort<T: Comparable>(_ array: [T]) -> (sortedArray: [T], numberOfOperations: Int)   {

        print("Executing insertion sort on array: \(array)")
        var array = array
        let lastElementIndex = array.count - 1
        var numberOfOperations = 0

        for index in 1...lastElementIndex {
            numberOfOperations += 1
            let currentElement = array[index]
            printInDebug("\tConsidering \(currentElement) in \(array)")

            // Start from `current` element and go to the left until you find elements that are bigger than `current`.
            // Move all these elements one position to the right
            var j = index - 1
            var comparedElement = array[j]
            printInDebug("\tComparing it with \(comparedElement)")

            while currentElement < comparedElement {
                numberOfOperations += 1
                array[j+1] = array[j]
                printInDebug("\tCoping compared element \(comparedElement) to the right. The new array is: \(array)")
                j -= 1
                let didCompareAllElements = j < 0
                if didCompareAllElements { break }
                comparedElement = array[j]
            }

            // Insert `current` element to the smallest position of the elements that we moved
            array[j+1] = currentElement
            printInDebug("\tWriting \(currentElement) to the smallest position of the moved elements: \(j+1). New array is \(array)")
        }
        printInDebug("\tFinished to sort array of \(array.count) elements, with \(numberOfOperations) comparisons")
        return (array, numberOfOperations)
    }
}
