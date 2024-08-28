# Diameter of Binary Tree
Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

## Tags
- DFS

## Strat
Perform dfs to find height of every node. Keep a global variable and at each node, update it with max of iteself and sum of left and right heights.

## Complexity

- Time: O(n)
- Space: O(h)

## Code

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        self.dia = 0

        def dfs(root):
            if root is None:
                return 0
            if root.left is None and root.right is None:
                return 1
            leftHeight = dfs(root.left)
            rightHeight = dfs(root.right)
            self.dia = max(self.dia, leftHeight + rightHeight)
            return max(leftHeight, rightHeight) + 1
        
        dfs(root)
        return self.dia
```