# Graph Valid Tree
Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.

## Tags
- DFS

## Strat
Add edges to map
Provide a prev parameter to dfs which is the prev node of the current node so that it doesnt go back there and detect an edge. If loop found, return false

## Complexity

- Time: O(V + E)
- Space: O(n)

## Code

```python
class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        if not n:
            return True
            
        edge_map = {i: [] for i in range(n)}
        for one, two in edges:
            edge_map[one].append(two)
            edge_map[two].append(one)
        
        visited = set()
        
        def dfs(node, prev):
            if node in visited:
                return False
            visited.add(node)
            for nei in edge_map[node]:
                if nei == prev:
                    continue
                if not dfs(nei, node):
                    return False
            return True
        
        return dfs(0,-1) and n == len(visited)
```