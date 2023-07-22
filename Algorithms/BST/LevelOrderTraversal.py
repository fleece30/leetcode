from BSTNode import BSTNode
from collections import deque


def levelOrderTraversal(root: BSTNode):
    queue = deque()
    queue.append(root)
    res = []
    while queue:
        level = []
        for i in range(len(queue)):
            node = queue.popleft()
            if node:
                level.append(node.val)
                queue.append(node.left)
                queue.append(node.right)
        if level:
            res.append(level)
    print(res)
