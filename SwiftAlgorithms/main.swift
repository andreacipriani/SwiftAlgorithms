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

class Graph: CustomStringConvertible {

    private var nodes: Set<Node> = Set([])
    private var edges: [Edge] = []

    func add(edge: Edge) {
        nodes.insert(edge.source)
        nodes.insert(edge.destination)
        edges.append(edge)
    }

    func visit(node: Node) {
        guard let index = nodes.index(of: node) else {
            print("Node \(node) not found")
            return
        }
        print("Visiting \(node)")
        nodes[index].visit()
    }

    func edges(of node: Node) -> [Edge] {
        return edges.filter { $0.source == node }
    }

    private var sortedNodes : [Node] {
        return nodes.sorted(by:) {
            $0.description < $1.description
        }
    }

    var visitedNodesDescription: String {
        return sortedNodes.reduce("Nodes: ", {$0 + $1.visitedDescription + "; "})
    }

    var description: String {
        var mutableDescription = visitedNodesDescription
        mutableDescription += "\nEdges:\n"
        for (index, edge) in edges.enumerated() {
            let isNotLastIndex = (index != (edges.count - 1))
            if isNotLastIndex {
                let nextEdgeHasDifferentSource = edge.source != edges[index + 1].source
                if nextEdgeHasDifferentSource {
                    mutableDescription += "\(edge)\n"
                } else {
                    mutableDescription += "\(edge); "
                }
            } else {
                mutableDescription += "\(edge)"
            }
        }
        return mutableDescription
    }

    func depthFirstVisitInOrder(node: Node) {

    }

    func depthFirstVisitPreOrder(node: Node) {
        visit(node: node)
        edges(of: node).forEach { edge in
            let destination = edge.destination
            if !destination.isVisited {
                depthFirstVisitPreOrder(node: destination)
            }
        }
    }

    func depthFirstVisitPostOrder(node: Node) {
        edges(of: node).forEach { edge in
            let destination = edge.destination
            depthFirstVisitPostOrder(node: destination)
        }
        visit(node: node)
    }
}

class GraphFactory {

    static func makeGraph() -> Graph {
        let graph = Graph()
        let f = Node(id: "F")
        let b = Node(id: "B")
        let a = Node(id: "A")
        let d = Node(id: "D")
        let c = Node(id: "C")
        let e = Node(id: "E")
        let g = Node(id: "G")
        let i = Node(id: "I")
        let h = Node(id: "H")
        graph.add(edge: Edge(source: f, destination: b))
        graph.add(edge: Edge(source: f, destination: g))
        graph.add(edge: Edge(source: b, destination: a))
        graph.add(edge: Edge(source: b, destination: d))
        graph.add(edge: Edge(source: d, destination: c))
        graph.add(edge: Edge(source: d, destination: e))
        graph.add(edge: Edge(source: g, destination: i))
        graph.add(edge: Edge(source: i, destination: h))
        return graph
    }
}

let graph = GraphFactory.makeGraph()
graph.depthFirstVisitPostOrder(node: Node(id: "F"))
