# Islands and Treasure

You are given a m×nm×n 2D grid initialized with these three possible values:

    -1 - A water cell that can not be traversed.
    0 - A treasure chest.
    INF - A land cell that can be traversed. We use the integer 2^31 - 1 = 2147483647 to represent INF.

Fill each land cell with the distance to its nearest treasure chest. If a land cell cannot reach a treasure chest than the value should remain INF.

Assume the grid can only be traversed up, down, left, or right.

## Tags
- Graph
- BFS

## Strat
Mostly same as number of islands. Keep min dist in queue and do bfs on every cell

## Complexity

- Time: O(n * m)
- Space: O(n)

## Code

```python
class Solution:
    def islandsAndTreasure(self, grid: List[List[int]]) -> None:
        rows, cols = len(grid), len(grid[0])
        inf = 2147483647
        
        def bfs(r, c):
            visited = set()
            q = collections.deque()
            visited.add((r,c))
            q.append((r,c,0))
            directions = [[1,0], [-1,0], [0,1], [0,-1]]
            min_dist = 0

            while q:
                row, col, dist = q.popleft()
                for dr, dc in directions:
                    new_r, new_c = row + dr, col + dc
                    if (
                        new_r in range(rows) and
                        new_c in range(cols) and
                        (new_r, new_c) not in visited
                    ):
                        if grid[new_r][new_c] != -1 and grid[new_r][new_c] != 0:
                            visited.add((new_r, new_c))
                            q.append((new_r, new_c, dist + 1))
                        elif grid[new_r][new_c] == 0:
                            grid[r][c] = min(dist + 1, grid[r][c])
                            return
                            

        for r in range(rows):
            for c in range(cols):
                if grid[r][c] != -1 and grid[r][c] != 0:
                    bfs(r,c)
    
```