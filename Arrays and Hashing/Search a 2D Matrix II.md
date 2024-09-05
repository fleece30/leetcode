# Search a 2D Matrix II
Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:

    Integers in each row are sorted in ascending from left to right.
    Integers in each column are sorted in ascending from top to bottom.

## Tags

## Strat
Start from top right. If greater than target, move left, else move down

## Complexity

- Time: O(m + n)
- Space: O(1)

## Code

```python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        i, j = 0, len(matrix[0]) - 1
        while i in range(len(matrix)) and j in range(len(matrix[0])):
            if matrix[i][j] == target:
                return True
            elif matrix[i][j] > target:
                j -= 1
            else:
                i += 1
        return False
```