import Foundation

final class BinaryTree {

    let root: BinaryTreeNode

    init(root: BinaryTreeNode) {
        self.root = root
    }
}

// Traversal algorithms

extension BinaryTree {

    func depthFirstVisitPreOrder(node: BinaryTreeNode?) {
        guard let node = node else { return }
        node.visit()
        depthFirstVisitPreOrder(node: node.left)
        depthFirstVisitPreOrder(node: node.right)
    }

    func depthFirstVisitInOrder(node: BinaryTreeNode?) {
        guard let node = node else { return }
        depthFirstVisitInOrder(node: node.left)
        node.visit()
        depthFirstVisitInOrder(node: node.right)
    }

    func depthFirstVisitPostOrder(node: BinaryTreeNode?) {
        guard let node = node else { return }
        depthFirstVisitPostOrder(node: node.left)
        depthFirstVisitPostOrder(node: node.right)
        node.visit()
    }
}
