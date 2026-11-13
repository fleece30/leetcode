---
id: 912
title: "Sort an Array"
difficulty: "Medium"
category: "Heap / Priority Queue"
---

# 912. Sort an Array

**Difficulty:** Medium

Given an array of integers `nums`, sort the array in ascending order and return it.

You must solve the problem **without using any built-in** functions in `O(nlog(n))` time complexity and with the smallest space complexity possible.

 

**Example 1:**

```

**Input:** nums = [5,2,3,1]
**Output:** [1,2,3,5]
**Explanation:** After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).

```

**Example 2:**

```

**Input:** nums = [5,1,1,2,0,0]
**Output:** [0,0,1,1,2,5]
**Explanation:** Note that the values of nums are not necessarily unique.

```

 

**Constraints:**

	
- `1 <= nums.length <= 5 * 10^4`
	
- `-5 * 10^4 <= nums[i] <= 5 * 10^4`

## Tags

- Array
- Divide and Conquer
- Sorting
- Heap (Priority Queue)
- Merge Sort
- Bucket Sort
- Radix Sort
- Counting Sort

## Strat

Implements heap sort in place. It first builds a max-heap by sifting down every non-leaf node. Then it repeatedly swaps the root (the maximum) with the last element of the heap, shrinks the heap by one, and sifts the new root down.

## Complexity

- Time: O(n log n)
- Space: O(1)

## Code

```python
class Solution:
    def _sift_down(self, nums: list[int], i: int, n: int):
        while True:
            l, r, max = 2 * i + 1, 2 * i + 2, i
            if l < n and nums[l] > nums[max]:
                max = l
            if r < n and nums[r] > nums[max]:
                max = r
            if max == i:
                return
            nums[i], nums[max] = nums[max], nums[i]
            i = max

    def sortArray(self, nums: list[int]) -> list[int]:
        n = len(nums)
        for i in range(n // 2 - 1, -1, -1):
            self._sift_down(nums, i, n)
        for end in range(n - 1, 0, -1):
            nums[0], nums[end] = nums[end], nums[0]
            self._sift_down(nums, 0, end)
        return nums
        
```
