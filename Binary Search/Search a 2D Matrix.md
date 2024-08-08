# Search a 2D Matrix

You are given an m x n integer matrix matrix with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.

Given an integer target, return true if target is in matrix or false otherwise.

You must write a solution in O(log(m \* n)) time complexity.

## Tags

- Binary Search

## Strat

Find the row in which the target must exist by checking last element of each row. Keep incrementing rows until the last element in that row is lesser than the target. If target is found at the last element, return true at that point.

When row is decided, run binary search on it.

## Complexity

- Time: O(log(m\*n))
- Space: O(1)

## Code

```python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        # Finding the row in which the num will exist
        row = -1
        for i in range(len(matrix)):
            if matrix[i][len(matrix[i]) - 1] == target:
                return True
            if matrix[i][len(matrix[i]) - 1] < target:
                continue
            row = i
            break

        if row == -1:
            return False

        low, high = 0, len(matrix[row])
        while low <= high:
            mid = (low + high) // 2
            if target == matrix[row][mid]:
                return True
            elif target < matrix[row][mid]:
                high = mid - 1
            else:
                low = mid + 1

        return False
```
