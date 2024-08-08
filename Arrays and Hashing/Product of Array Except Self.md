# Product of Array Except Self

Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.

## Tags

- Arrays

## Strat

In res array, first add all left products, then start from end, add mul of res and num, then update every index of num by multiplying with last right product

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        res = [1]
        for i in range(1, len(nums)):
            res.append(nums[i-1] * res[i-1])

        for i in range(len(nums) - 2, -1, -1):
            res[i] *= nums[i+1]
            nums[i] *= nums[i+1]

        return res

```
