---
id: 217
title: "Contains Duplicate"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 217. Contains Duplicate

**Difficulty:** Easy

Given an integer array `nums`, return `true` if any value appears **at least twice** in the array, and return `false` if every element is distinct.

 

**Example 1:**

**Input:** nums = [1,2,3,1]

**Output:** true

**Explanation:**

The element 1 occurs at the indices 0 and 3.

**Example 2:**

**Input:** nums = [1,2,3,4]

**Output:** false

**Explanation:**

All elements are distinct.

**Example 3:**

**Input:** nums = [1,1,1,3,3,4,3,2,4,2]

**Output:** true

 

**Constraints:**

	
- `1 <= nums.length <= 10^5`
	
- `-10^9 <= nums[i] <= 10^9`

## Tags

- Array
- Hash Table
- Sorting

## Strat

Iterate through the numbers while keeping a set of values already seen. If the current number is already in the set, a duplicate exists and it returns True immediately; otherwise it adds the number to the set. If the loop finishes without a repeat, it returns False.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        book = set()
        for i in nums:
            if i in book:
                return True
            book.add(i)
        return False
```
