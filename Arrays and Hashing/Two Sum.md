# Two Sum

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

## Tags
- Array
- Hash Table

## Strat

Create a map and for each num, check if (target - num) exists in map. If yes, return the 2, else, add the new num to the map

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        map = {}
        for i in range(len(nums)):
            if target-nums[i] in map:
                return [map[target-nums[i]], i]
            if not nums[i] in map:
                map[nums[i]] = i 
```