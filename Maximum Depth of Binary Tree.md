# Maximum Depth of Binary Tree
Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

## Tags
- Binary Tree
- Recursion

## Strat
get max depth of right and left subtree and add 1 to it for the current subtree

## Complexity

- Time: O(n)
- Space: O(n) worst case, O(logn) best case

## Code

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0
        max_len = max(self.maxDepth(root.right), self.maxDepth(root.left)) + 1
        return max_len
```