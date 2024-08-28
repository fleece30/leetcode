# Level Order Traversal of Binary Tree
Given a binary tree root, return the level order traversal of it as a nested list, where each sublist contains the values of nodes at a particular level in the tree, from left to right.

## Tags
- BFS

## Strat
Do tree BFS

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        res = []

        if root is None:
            return res

        def bfs(root):
            q = collections.deque()
            q.append(root)

            while q:
                level_size = len(q)
                level = []

                for _ in range(level_size):
                    curr = q.popleft()

                    if curr.left:
                        q.append(curr.left)
                    if curr.right:
                        q.append(curr.right)
                    
                    level.append(curr.val)
                
                res.append(level)

        bfs(root)
        
        return res
        
```