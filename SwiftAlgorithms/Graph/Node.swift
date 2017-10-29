import Foundation

class Node: Hashable, CustomStringConvertible {

    let id: String
    var isVisited: Bool

    init(id: String, isVisited: Bool = false) {
        self.id = id
        self.isVisited = isVisited
    }

    func visit() {
        if isVisited {
            print("\(description) was already visited")
        }
        isVisited = true
    }

    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }

    var hashValue: Int {
        return id.hashValue
    }

    var description: String {
        return "\(id)"
    }

    var visitedDescription: String {
        let visitedDescription = isVisited ? "[X]" : "[]"
        return description + " " + visitedDescription
    }
}
