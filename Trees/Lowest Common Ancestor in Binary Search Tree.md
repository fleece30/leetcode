# Lowest Common Ancestor in Binary Search Tree
Given a binary search tree (BST) where all node values are unique, and two nodes from the tree p and q, return the lowest common ancestor (LCA) of the two nodes.

The lowest common ancestor between two nodes p and q is the lowest node in a tree T such that both p and q as descendants. The ancestor is allowed to be a descendant of itself.


## Tags
- BST

## Strat
Ancestor found when one of them is equal to root or at the node where their values diverge

## Complexity

- Time: O(h)
- Space: O(h) -> cos of the recursion stack

## Code

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        if p.val == root.val:
            return p
        if q.val == root.val:
            return q

        if (root.val > p.val and root.val < q.val) or (root.val > q.val and root.val < p.val):
            return root
        
        if root.val > p.val and root.val > q.val:
            return self.lowestCommonAncestor(root.left, p, q)

        if root.val < p.val and root.val < q.val:
            return self.lowestCommonAncestor(root.right, p, q)
```