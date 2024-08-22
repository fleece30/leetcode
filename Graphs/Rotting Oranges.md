# Rotting Oranges
You are given an m x n grid where each cell can have one of three values:

    0 representing an empty cell,
    1 representing a fresh orange, or
    2 representing a rotten orange.

Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

## Tags
- Graph
- BFS

## Strat
Get all rotten and init queue with them. Run loop till q and rot every cell adjacent to cells in q. After each iteration of q is processed, increase time by 1

## Complexity

- Time: O(r * c)
- Space: O(r * c)

## Code

```python
class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        rows, cols = len(grid), len(grid[0])
        time, fresh = 0, 0
        q = collections.deque()

        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 1:
                    fresh += 1
                elif grid[r][c] == 2:
                    q.append([r,c])

        while q and fresh > 0:
            directions = [[1,0], [-1,0], [0,1], [0,-1]]
            for i in range(len(q)):
                r,c = q.popleft()
                for dr, dc in directions:
                    new_r, new_c = r + dr, c + dc
                    if (new_r in range(rows) and
                    new_c in range(cols) and
                    grid[new_r][new_c] == 1):
                        fresh -= 1
                        grid[new_r][new_c] = 2
                        q.append([new_r, new_c])
            time += 1
        return time if fresh == 0 else -1
```