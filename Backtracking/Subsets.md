# Subsets
Given an integer array nums of unique elements, return all possible subsets(the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

## Tags
- Backtracking

## Strat
For each number, can either include it or not. So check both paths

## Complexity

- Time: O(2^n * n)
- Space: O(2^n * n)

## Code

```python
class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = []
        
        def backtrack(start, current):
            res.append(current[:])
            for i in range(start, len(nums)):
                current.append(nums[i])
                backtrack(i + 1, current)
                current.pop()
        
        backtrack(0, [])
        return res
```