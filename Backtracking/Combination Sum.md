# Combination Sum
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the
frequency
of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

## Tags
- Backtracking

## Strat
Add current element to current, explore path with this included, pop, explore with this excluded

## Complexity

- Time: O(2^n)
- Space: O(2^n)

## Code

```python
class Solution:
    def combinationSum(self, nums: List[int], target: int) -> List[List[int]]:
        res = []

        def backtrack(start, current, total):
            if total == target:
                res.append(current[:])
                return
            
            if start >= len(nums) or total > target:
                return
            
            
            current.append(nums[start])
            backtrack(start, current, total + nums[start])
            current.pop()
            backtrack(start + 1, current, total)
        
        backtrack(0, [], 0)
        return res
```