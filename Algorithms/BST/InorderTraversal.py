from BST import BSTNode


def inorderTraversal(node: BSTNode):
    if node is None:
        return
    inorderTraversal(node.left)
    print(node.val, end=", ")
    inorderTraversal(node.right)