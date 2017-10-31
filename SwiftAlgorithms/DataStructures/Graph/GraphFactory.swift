import Foundation

class GraphFactory {

/*
     It creates this graph:
               +---+
               | A |
               +---+
               |   |
           +---+   +---+   +---+
           | B |   | C | - | F |
           +---+   +---+   +---+
                   |   |
               +---+   +---+
               | D |   | E |
               +---+   +---+
 */

    static func makeGraph() -> Graph {
        let graph = Graph()

        let nodesForIds = "ABCDEF".characters.map{ Node(id: String($0)) }.reduce([String: Node]()) {
            var mutableResult = $0
            mutableResult[$1.id] = $1
            return mutableResult
        }
        graph.add(edge: edge(from: "A", to: "B", in: nodesForIds))
        graph.add(edge: edge(from: "A", to: "C", in: nodesForIds))
        graph.add(edge: edge(from: "C", to: "D", in: nodesForIds))
        graph.add(edge: edge(from: "C", to: "E", in: nodesForIds))
        graph.add(edge: edge(from: "C", to: "F", in: nodesForIds))
        return graph
    }

    static private func edge(from sourceId: String, to destinationId: String, in nodesForIds: [String: Node]) -> Edge {
        let sourceNode = nodesForIds[sourceId]!
        let destinationNode = nodesForIds[destinationId]!
        return Edge(source: sourceNode, destination: destinationNode)
    }
}
