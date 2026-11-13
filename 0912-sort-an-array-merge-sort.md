---
id: 912
title: "Sort an Array"
difficulty: "Medium"
category: "Arrays & Hashing"
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

Recursive merge sort: split the array in half, sort each half recursively, then merge the two sorted halves by repeatedly comparing the front elements. The merge uses list.pop(0), which shifts the remaining elements on each call and adds extra cost.

## Complexity

- Time: O(n^2)
- Space: O(n log n)

## Code

```python
class Solution:
    def _merge(self, nums1: list[int], nums2: list[int]) -> list[int]:
        temp = []
        while len(nums1) > 0 and len(nums2) > 0:
            if nums1[0] > nums2[0]:
                temp.append(nums2[0])
                nums2.pop(0)
            else:
                temp.append(nums1[0])
                nums1.pop(0)

        while len(nums1) > 0:
            temp.append(nums1[0])
            nums1.pop(0)
        while len(nums2) > 0:
            temp.append(nums2[0])
            nums2.pop(0)

        return temp
        
    def _mergesort(self, nums: list[int]) -> list[int]:
        length = len(nums)
        if length <= 1:
            return nums
        middle = length // 2
        left = self._mergesort(nums[:middle])
        right = self._mergesort(nums[middle:])
        
        return self._merge(left, right)

    def sortArray(self, nums: list[int]) -> list[int]:
        return self._mergesort(nums)
        
```
