import Foundation
import Darwin

enum TimeComplexity {
    case logaritmic
    case linear
    case nLogN
    case quadratic
    case exponential
}

class TimeComplexityCalculator {

    static func calculate(executedOperations: Int, inputSize: Int) -> TimeComplexity {
        let logaritmicOperations = Int(log2(Double(inputSize)))
        let nLogNOperations = inputSize * logaritmicOperations
        let quadraticOperations = inputSize * inputSize
        let exponentialOperations = Int.max // It's ok for inputSize > 32

        let nOperationsForComplexities: [TimeComplexity: Int] = [.logaritmic: logaritmicOperations,
                                                               .linear: inputSize,
                                                               .nLogN: nLogNOperations,
                                                               .quadratic: quadraticOperations,
                                                               .exponential: exponentialOperations]
        return closestTimeComplexity(executedOperations: executedOperations, nOperationsForComplexities: nOperationsForComplexities)
    }

    static private func closestTimeComplexity(executedOperations: Int, nOperationsForComplexities: [TimeComplexity: Int]) -> TimeComplexity {

        let executedOperationsDigitCount = executedOperations.digitCount
        var closestDigitDiff = -1
        var closestOperationsDiff: Int!
        var closestTimeComplexity: TimeComplexity!

        nOperationsForComplexities.keys.forEach { complexity in
            let expectedOperations = nOperationsForComplexities[complexity]!
            let digitDiff = abs(executedOperationsDigitCount - expectedOperations.digitCount)
            let operationsDiff = abs(executedOperations - expectedOperations)
            if digitDiff < closestDigitDiff || closestDigitDiff == -1 {
                closestDigitDiff = digitDiff
                closestOperationsDiff = operationsDiff
                closestTimeComplexity = complexity
            } else if digitDiff == closestDigitDiff {
                if operationsDiff < closestOperationsDiff {
                    closestOperationsDiff = operationsDiff
                    closestTimeComplexity = complexity
                }
            }
        }
        return closestTimeComplexity
    }
}

func twoPowerOf(n: Int) -> Int {
    return Int(pow(2.0, Double(n)))
}
