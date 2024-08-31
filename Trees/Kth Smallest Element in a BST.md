# Kth Smallest Element in a BST
Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

## Tags
- Inorder Traversal

## Strat
Do inorder and keep track of k. When k reaches 0, update res with the current root value and return

## Complexity

- Time: O(h)
- Space: O(1)

## Code

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        self.k = k
        self.res = 0
        def inorder(root):
            if not root:
                return
            inorder(root.left)
            self.k -= 1
            if self.k == 0:
                self.res = root.val
                return
            inorder(root.right)

        inorder(root)
        return self.res
```