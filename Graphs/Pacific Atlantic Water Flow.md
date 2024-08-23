# Pacific Atlantic Water Flow
There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.

![figure](https://assets.leetcode.com/uploads/2021/06/08/waterflow-grid.jpg)

## Tags
- BFS

## Strat
Run BFS from border cells and go uphill to reach cells that can reach that ocean. Take intersection of both ocean sets

## Complexity

- Time: O(r * c)
- Space: O(r * c)

## Code

```python
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        rows, cols = len(heights), len(heights[0])
        res = []
        pac, atl = set(), set()

        def bfs(r, c, o):
            directions = [[1,0], [-1,0], [0,1], [0,-1]]
            q = collections.deque()
            q.append((r,c))
            o.add((r, c))

            while q:
                row, col = q.popleft()
                for dr, dc in directions:
                    nr, nc = row + dr, col + dc
                    if (
                        nr in range(rows) and
                        nc in range(cols) and
                        heights[nr][nc] >= heights[row][col] and
                        (nr, nc) not in o
                    ):
                        q.append((nr, nc))
                        o.add((nr, nc))

        for r in range(rows):
            bfs(r, 0, pac)
            bfs(r, cols - 1, atl)
        for c in range(cols):
            bfs(0, c, pac)
            bfs(rows - 1, c, atl)
        
        return list(pac & atl)
```