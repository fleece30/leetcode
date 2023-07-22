from typing import Optional
from BSTNode import BSTNode
# from Invert import invertBST
from LevelOrderTraversal import levelOrderTraversal


def insert(node: BSTNode, val: int):
    if node is None:
        return BSTNode(val)
    if val > node.val:
        node.right = insert(node.right, val)
    else:
        node.left = insert(node.left, val)

    return node


def search(node: BSTNode, val: int):
    if node is None or node.val == val:
        return node
    if val > node.val:
        return search(node.right, val)
    else:
        return search(node.left, val)


def inorderTraversal(node: BSTNode):
    if node is None:
        return
    inorderTraversal(node.left)
    print(node.val, end=", ")
    inorderTraversal(node.right)


def deleteNode(node: BSTNode, val: int):
    if node is None:
        return node

    # Finding the node to delete
    if val > node.val:
        node.right = deleteNode(node.right, val)
    elif val < node.val:
        node.left = deleteNode(node.left, val)
    else:
        # Node has only 1 child
        if node.left is None:
            return node.right
        elif node.right is None:
            return node.left

        # Node has 2 children
        else:
            curr = node.right
            while curr.left is not None:
                curr = curr.left

            node.val = curr.val
            node.right = deleteNode(node.right, curr.val)

    return node


if __name__ == '__main__':
    root: Optional[BSTNode] = None
    root = insert(root, 45)
    root = insert(root, 30)
    root = insert(root, 50)
    root = insert(root, 25)
    root = insert(root, 35)
    root = insert(root, 32)
    root = insert(root, 44)
    root = insert(root, 42)
    root = insert(root, 43)
    root = insert(root, 60)
    root = insert(root, 4)

    searchValue = 4
    if search(root, searchValue) is not None:
        print(f"{searchValue} found")
    else:
        print(f"{searchValue} not found")

    inorderTraversal(root)
    print("\n")
    deleteNode(root, 35)
    inorderTraversal(root)
    print("\n")
    levelOrderTraversal(root)
