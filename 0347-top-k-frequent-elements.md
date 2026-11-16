---
id: 347
title: "Top K Frequent Elements"
difficulty: "Medium"
category: "Arrays & Hashing"
---

# 347. Top K Frequent Elements

**Difficulty:** Medium

Given an integer array `nums` and an integer `k`, return the `k` most frequent elements. You may return the answer in **any order**.

 

**Example 1:**

**Input:** nums = [1,1,1,2,2,3], k = 2

**Output:** [1,2]

**Example 2:**

**Input:** nums = [1], k = 1

**Output:** [1]

**Example 3:**

**Input:** nums = [1,2,1,2,1,2,3,1,3,2], k = 2

**Output:** [1,2]

 

**Constraints:**

	
- `1 <= nums.length <= 10^5`
	
- `-10^4 <= nums[i] <= 10^4`
	
- `k` is in the range `[1, the number of unique elements in the array]`.
	
- It is **guaranteed** that the answer is **unique**.

 

**Follow up:** Your algorithm's time complexity must be better than `O(n log n)`, where n is the array's size.

## Tags

- Array
- Hash Table
- Divide and Conquer
- Sorting
- Heap (Priority Queue)
- Bucket Sort
- Counting
- Quickselect

## Strat

Count each number's frequency with a Counter, then place numbers into buckets indexed by frequency (bucket sort). Iterate the buckets from highest frequency to lowest, collecting elements until at least k have been gathered, and return the first k.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def topKFrequent(self, nums: list[int], k: int) -> list[int]:
        count = Counter(nums)
        bucket = [None] * (len(nums) + 1)

        for e, v in count.items():
            if bucket[v] is None:
                bucket[v] = [e]
            else:
                bucket[v].append(e)
        res = []
        
        for i in reversed(bucket):
            if i:
                res.extend(i)
                if len(res) >= k:
                    return res[:k]
        return res
```
