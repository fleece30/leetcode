---
id: 169
title: "Majority Element"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 169. Majority Element

**Difficulty:** Easy

Given an array `nums` of size `n`, return the majority element.

The majority element is the element that appears more than `⌊n / 2⌋` times. You may assume that the majority element always exists in the array.

 

**Example 1:**

```
**Input:** nums = [3,2,3]
**Output:** 3

```

**Example 2:**

```
**Input:** nums = [2,2,1,1,1,2,2]
**Output:** 2

```

 

**Constraints:**

	
- `n == nums.length`
	
- `1 <= n <= 5 * 10^4`
	
- `-10^9 <= nums[i] <= 10^9`
	
- The input is generated such that a majority element will exist in the array.

 

**Follow-up:** Could you solve the problem in linear time and in `O(1)` space?

## Tags

- Array
- Hash Table
- Divide and Conquer
- Sorting
- Counting
- Boyer–Moore Majority Vote Algorithm

## Strat

Uses the Boyer-Moore voting algorithm. It keeps a candidate and a counter, adopts the current number as the candidate when the counter is zero, and increments or decrements the counter depending on whether each number matches the candidate. The majority element outvotes all others, so it is the candidate left at the end.

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def majorityElement(self, nums: list[int]) -> int:
        res = count = 0
        for i in nums:
            if count == 0:
                res = i
            count += (1 if i == res else -1)
        return res
        
```
