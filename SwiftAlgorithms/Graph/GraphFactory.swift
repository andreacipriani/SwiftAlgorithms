import Foundation

class GraphFactory {

/*
     It creates this graph:
     https://en.wikipedia.org/wiki/Tree_traversal#/media/File:Sorted_binary_tree_preorder.svg
 */

    static func makeGraph() -> Graph {
        let graph = Graph()

        let nodesForIds = "ABCDEFGHI".characters.map{ Node(id: String($0)) }.reduce([String: Node]()) {
            var mutableResult = $0
            mutableResult[$1.id] = $1
            return mutableResult
        }
        graph.add(edge: edge(from: "F", to: "B", in: nodesForIds))
        graph.add(edge: edge(from: "F", to: "G", in: nodesForIds))
        graph.add(edge: edge(from: "B", to: "A", in: nodesForIds))
        graph.add(edge: edge(from: "B", to: "D", in: nodesForIds))
        graph.add(edge: edge(from: "D", to: "C", in: nodesForIds))
        graph.add(edge: edge(from: "D", to: "E", in: nodesForIds))
        graph.add(edge: edge(from: "G", to: "I", in: nodesForIds))
        graph.add(edge: edge(from: "I", to: "H", in: nodesForIds))

        return graph
    }

    static private func edge(from sourceId: String, to destinationId: String, in nodesForIds: [String: Node]) -> Edge {
        let sourceNode = nodesForIds[sourceId]!
        let destinationNode = nodesForIds[destinationId]!
        return Edge(source: sourceNode, destination: destinationNode)
    }
}

