import Foundation

class BinaryTreeNode: Node {

    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(id: String, isVisited: Bool = false, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil) {
        self.left = left
        self.right = right
        super.init(id: id, isVisited: isVisited)
    }
}
