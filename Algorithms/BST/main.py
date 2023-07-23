from typing import Optional
from BSTNode import BSTNode
from Invert import invertBST
from LevelOrderTraversal import levelOrderTraversal
from InorderTraversal import inorderTraversal
from BSTBasic import deleteNode, insert, search


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
    invertBST(root)