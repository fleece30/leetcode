# Max Area of Island

You are given a matrix grid where grid[i] is either a 0 (representing water) or 1 (representing land).

An island is defined as a group of 1's connected horizontally or vertically. You may assume all four edges of the grid are surrounded by water.

The area of an island is defined as the number of cells within the island.

Return the maximum area of an island in grid. If no island exists, return 0.

## Tags
- Graph
- BFS

## Strat
Do the num islands solution, just keep track of when connecting 1 is found and area of each island

## Complexity

- Time: O(rows * cols)
- Space: O(rows)

## Code

```python
class Solution:
    def maxAreaOfIsland(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        visited = set()
        max_island_size = 0

        def bfs(r, c):
            island_size = 1
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
                        (new_r, new_c) not in visited and
                        grid[new_r][new_c] == 1
                    ):
                        visited.add((new_r, new_c))
                        q.append((new_r, new_c))
                        island_size += 1
            return island_size


        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 1 and (r,c) not in visited:
                    island_size = bfs(r,c)
                    max_island_size = max(max_island_size, island_size)

        return max_island_size
```