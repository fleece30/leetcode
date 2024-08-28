# Binary Tree Right Side View
You are given the root of a binary tree. Return only the values of the nodes that are visible from the right side of the tree, ordered from top to bottom.

## Tags
- BFS

## Strat
Do BFS, on each level, if current node is the last node, add it to res

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
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        res = []

        if not root:
            return res

        def bfs(root):
            q = collections.deque()
            q.append(root)

            while q:
                level_size = len(q)

                for i in range(level_size):
                    curr = q.popleft()

                    if i == level_size - 1:
                        res.append(curr.val)

                    if curr.left:
                        q.append(curr.left)
                    if curr.right:
                        q.append(curr.right)
                    
        
        bfs(root)

        return res
```