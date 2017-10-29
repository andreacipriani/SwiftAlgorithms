import Foundation

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
