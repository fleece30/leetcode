# Invert Binary Tree
Given the root of a binary tree, invert the tree, and return its root.

## Tags
- Binary Tree
- Recursion

## Strat
Swap left and right nodes and re-call the function on the swapped nodes. Return root finally.

## Complexity

- Time: O(n)
- Space: O(n) worst case, O(logn) best case -> depends on recursion stack

## Code

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root:
            return root
        

       	temp = root.right
       	root.right = root.left
       	root.left = temp

       	self.invertTree(root.left)
       	self.invertTree(root.right)

        return root
```