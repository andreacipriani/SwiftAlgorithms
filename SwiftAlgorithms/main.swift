import Foundation

//let graph = GraphFactory.makeGraph()
//let graphRoot = Node(id: "A")
//graph.depthFirstVisit(from: graphRoot)  // A,B,C,D,E,F

//let tree = BinaryTreeFactory.makeSortedBinaryTree()
//tree.depthFirstVisitPreOrder(node: tree.root)    // F,B,A,D,C,E,G,I,H
//tree.depthFirstVisitInOrder(node: tree.root)   // A,B,C,D,E,F,G,H,I
//tree.depthFirstVisitPostOrder(node: tree.root) // A,C,E,D,B,H,I,G,F


let shouldPrintDebugInfo = false
let inputSize = 1000
let array = IntegersArrayFactory.makeRandomIntegersArray(size: inputSize)

// MARK: - Shared functions

func printInDebug(_ items: Any...) {
    guard shouldPrintDebugInfo else { return }
    print(items)
}

func executeInsertionSort() {
    let insertionSortResult = InsertionSort().sort(array)
    print("Sorted array is: \(insertionSortResult.sortedArray)")
    let insertionSortTimeComplexity = TimeComplexityCalculator.calculate(nOperations: insertionSortResult.numberOfOperations, inputSize: inputSize)
    print("Time complexity of insertion sort looks like \(insertionSortTimeComplexity)")
}

func executeQuickSort() {
    let quickSortResult = QuickSort().sort(array)
    print("Sorted array is: \(quickSortResult.sortedArray)")
    let quickSortTimeComplexity = TimeComplexityCalculator.calculate(nOperations: quickSortResult.numberOfOperations, inputSize: inputSize)
    print("Time complexity of quick sort looks like \(quickSortTimeComplexity)")
}

func executeBubbleSort() {
    let bubbleSortResult = BubbleSort().sort(array)
    print("Sorted array is: \(bubbleSortResult.sortedArray)")
    let bubbleSortTimeComplexity = TimeComplexityCalculator.calculate(nOperations: bubbleSortResult.numberOfOperations, inputSize: inputSize)
    print("Time complexity of bubble sort looks like \(bubbleSortTimeComplexity)")
}

// MARK: - Execution

executeQuickSort()

