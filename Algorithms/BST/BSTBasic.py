from BSTNode import BSTNode


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
