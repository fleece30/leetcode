# Number of Islands

Given a 2D grid grid where '1' represents land and '0' represents water, count and return the number of islands.

An island is formed by connecting adjacent lands horizontally or vertically and is surrounded by water. You may assume water is surrounding the grid (i.e., all the edges are water). 

## Tags
- Graph
- BFS

## Strat

## Complexity

- Time: O(V+E)
- Space: O(n)

## Code

```python
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        rows, cols = len(grid), len(grid[0])
        visited = set()
        islands = 0

        def bfs(r, c):
            q = collections.deque()
            visited.add((r,c))
            q.append((r,c))
            directions = [[1,0], [-1,0], [0,1], [0,-1]]

            while q:
                row, col = q.popleft()
                for dr, dc in directions:
                    new_r, new_c = row + dr, col + dc
                    if (
                        new_r in range(rows) and
                        new_c in range(cols) and
                        grid[new_r][new_c] == "1" and
                        (new_r, new_c) not in visited
                    ):
                        visited.add((new_r, new_c))
                        q.append((new_r, new_c))
        
        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == "1" and (r,c) not in visited:
                    bfs(r, c)
                    islands += 1
        
        return islands
```