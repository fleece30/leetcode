---
id: 75
title: "Sort Colors"
difficulty: "Medium"
category: "Two Pointers"
---

# 75. Sort Colors

**Difficulty:** Medium

You are given an array `nums` with `n` objects colored red, white, or blue, sort them **in-place **so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

You must solve this problem without using the library's sort function.

 

**Example 1:**

**Input:** nums = [2,0,2,1,1,0]

**Output:** [0,0,1,1,2,2]

**Explanation:**

The array has two 0s, two 1s, and two 2s. Sorting them in-place places all 0s first, then all 1s, then all 2s.

**Example 2:**

**Input:** nums = [2,0,1]

**Output:** [0,1,2]

**Explanation:**

The array has one each of 0, 1, and 2, arranged in-place in the order 0, 1, 2.

 

**Constraints:**

	
- `n == nums.length`
	
- `1 <= n <= 300`
	
- `nums[i]` is either 0, 1, or 2.

 

**Follow up:** Could you come up with a one-pass algorithm using only constant extra space?

## Tags

- Array
- Two Pointers
- Sorting
- Quicksort
- Bubble Sort

## Strat

Uses the Dutch National Flag algorithm with three pointers: l marks the boundary for 0s, r marks the boundary for 2s, and i scans the array. A 0 is swapped to the left boundary, a 2 is swapped to the right boundary (without advancing i, since the swapped-in value is unchecked), and a 1 is skipped.

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def sortColors(self, nums: list[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        def _swap(a: int, b: int):
            temp = nums[a]
            nums[a] = nums[b]
            nums[b] = temp

        l = i = 0
        r = len(nums) - 1

        while i <= r:
            if nums[i] == 0:
                _swap(l, i)
                l += 1
                i += 1
            elif nums[i] == 1:
                i += 1
            else:
                _swap(r, i)
                r -= 1
```
