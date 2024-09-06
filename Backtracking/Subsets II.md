# Subsets II
Given an integer array nums that may contain duplicates, return all possible subsets(the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

## Tags
- Backtracking

## Strat
Sort input, do normal subset. While not including current element, skip over all occurances of it.

## Complexity

- Time: O(2^n)
- Space: O(2^n)

## Code

```python
class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        res, subset = [], []

        def backtrack(start):
            if start >= len(nums):
                res.append(subset[:])
                return

            subset.append(nums[start])
            backtrack(start + 1)
            subset.pop()
            while start + 1 < len(nums) and nums[start] == nums[start + 1]:
                start += 1
            backtrack(start + 1)
        
        backtrack(0)
        return res
```