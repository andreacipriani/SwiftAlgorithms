import Foundation

class BinaryTreeFactory {

    /*
     It creates this sorted binary tree:
     https://en.wikipedia.org/wiki/Tree_traversal#/media/File:Sorted_binary_tree_preorder.svg

             +---+
             | F |
             +---+
             |   |
         +---+   +---+
         | B |   | G |
         +---+   +---+\
         |   |         \
     +---+   +---+      \___+---+
     | A |   | D |          | I |
     +---+   +---+          +---+
             |   |          |
         +---+   +---+ +---+
         | C |   | E | | H |
         +---+   +---+ +---+
     */

    static func makeSortedBinaryTree() -> BinaryTree {

        let d = BinaryTreeNode(id: "D", left: BinaryTreeNode(id: "C"), right: BinaryTreeNode(id: "E"))
        let b = BinaryTreeNode(id: "B", left: BinaryTreeNode(id: "A"), right: d)
        let i = BinaryTreeNode(id: "I", left: BinaryTreeNode(id: "H"))
        let g = BinaryTreeNode(id: "G", right: i)
        let f = BinaryTreeNode(id: "F", left: b, right: g)
        return BinaryTree(root: f)
    }
}
