# 3Sum

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

## Tags

- Array
- Two pointers

## Strat

Sort the array. Then skip the first same elements. Now for each element, run a two sum for sorted array i.e. take 2 pointers on left and right and according to the sum, update the pointers. Remember to skip the same elements in each iteration.

## Complexity

- Time: O(n^2)
- Space: O(1) or O(n) depending on the sorting library used

## Code

```python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        result = []
        nums.sort()
        for i in range(len(nums)):
            if i!=0 and nums[i] == nums[i-1]:
                continue
            left, right = i+1, len(nums)-1
            while left < right:
                if nums[i] + nums[left] + nums[right] == 0:
                    result.append([nums[i], nums[left], nums[right]])
                    left+=1
                    right-=1
                    while left < right and nums[left] == nums[left-1]:
                        left+=1
                elif nums[i] + nums[left] + nums[right] > 0:
                    right-=1
                else:
                    left+=1

        return result
```
