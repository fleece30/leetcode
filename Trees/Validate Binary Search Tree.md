# Validate Binary Search Tree
Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

    The left subtree of a node contains only nodes with keys less than the node's key.
    The right subtree of a node contains only nodes with keys greater than the node's key.
    Both the left and right subtrees must also be binary search trees.


## Tags
- DFS

## Strat
Keep left and right bounds for each node. For root -> -inf to inf. For left of root -> -inf and root and so on

## Complexity

- Time: O(n)
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
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        def isValid(root, left, right):
            if not root:
                return True
            return (left < root.val < right
            and isValid(root.left, left, root.val)
            and isValid(root.right, root.val, right))
            

        return isValid(root, -float('inf'), float('inf'))
```