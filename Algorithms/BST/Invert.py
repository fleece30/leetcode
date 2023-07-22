from BSTNode import BSTNode


# Resulting tree would not be a BST, but whatever. I'm too lazy to make another directory for Binary Trees
def invertBST(root: BSTNode):
    if root:
        root.left, root.right = invertBST(root.right), invertBST(root.left)
    return root
