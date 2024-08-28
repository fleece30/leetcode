# Single Number
Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.

## Tags
- XOR

## Strat
Take XOR of whole array -> x ^ x = 0 and x ^ 0 = x. So, in the end, number with no duplicates will be left

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        res = nums[0]

        for i in range(1, len(nums)):
            res ^= nums[i]
        
        return res
```