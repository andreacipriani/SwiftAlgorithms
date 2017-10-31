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

    static func calculate(nOperations: Int, inputSize: Int) -> TimeComplexity {
        let logaritmicOperations = Int(log2(Double(inputSize)))
        let nLogNOperations = inputSize * logaritmicOperations
        let quadraticOperations = inputSize * inputSize
        let exponentialOperations = Int.max // It's ok for inputSize > 32

        let operationForComplexities: [TimeComplexity: Int] = [.logaritmic: logaritmicOperations,
                                                               .linear: inputSize,
                                                               .nLogN: nLogNOperations,
                                                               .quadratic: quadraticOperations,
                                                               .exponential: exponentialOperations]
        return closestTimeComplexity(n: nOperations, operationForComplexities:operationForComplexities)
    }

    static private func closestTimeComplexity(n: Int, operationForComplexities: [TimeComplexity: Int]) -> TimeComplexity {

        let firstRange = operationForComplexities.keys.first!
        var closestTimeComplexity = firstRange
        var closestDiff = operationForComplexities[firstRange]!

        var rangeDiff: Int!

        operationForComplexities.keys.forEach { complexity in
            rangeDiff = abs(n - operationForComplexities[complexity]!)
            if rangeDiff < closestDiff {
                closestDiff = rangeDiff
                closestTimeComplexity = complexity
            }
        }
        return closestTimeComplexity
    }
}

func twoPowerOf(n: Int) -> Int {
    return Int(pow(2.0, Double(n)))
}
