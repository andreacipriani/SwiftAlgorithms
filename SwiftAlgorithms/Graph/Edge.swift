import Foundation

struct Edge: Hashable, CustomStringConvertible {

    let source: Node
    let destination: Node

    static func ==(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination
    }

    var hashValue: Int {
        return source.hashValue ^ destination.hashValue
    }

    var description: String {
        return "\(source) -> \(destination)"
    }
}
