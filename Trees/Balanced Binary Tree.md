# Balanced Binary Tree
Given a binary tree, return true if it is height-balanced and false otherwise.

A height-balanced binary tree is defined as a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

## Tags
- DFS

## Strat
Find height of each subtree and check if difference is more than 1

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
    def isBalanced(self, root: Optional[TreeNode]) -> bool:
        self.isBalanced = True
        def dfs(root):
            if root is None or not self.isBalanced:
                return 0
            if root.left is None and root.right is None:
                return 1
            
            leftHeight = dfs(root.left)
            rightHeight = dfs(root.right)
            if abs(leftHeight - rightHeight) > 1:
                self.isBalanced = False
            return 1 + max(leftHeight, rightHeight)
        
        dfs(root)
        return self.isBalanced
```