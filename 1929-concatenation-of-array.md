---
id: 1929
title: "Concatenation of Array"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 1929. Concatenation of Array

**Difficulty:** Easy

Given an integer array `nums` of length `n`, you want to create an array `ans` of length `2n` where `ans[i] == nums[i]` and `ans[i + n] == nums[i]` for `0 <= i < n` (**0-indexed**).

Specifically, `ans` is the **concatenation** of two `nums` arrays.

Return the array `ans`.

 

**Example 1:**

```

**Input:** nums = [1,2,1]
**Output:** [1,2,1,1,2,1]
**Explanation:** The array ans is formed as follows:
- ans = [nums[0],nums[1],nums[2],nums[0],nums[1],nums[2]]
- ans = [1,2,1,1,2,1]
```

**Example 2:**

```

**Input:** nums = [1,3,2,1]
**Output:** [1,3,2,1,1,3,2,1]
**Explanation:** The array ans is formed as follows:
- ans = [nums[0],nums[1],nums[2],nums[3],nums[0],nums[1],nums[2],nums[3]]
- ans = [1,3,2,1,1,3,2,1]

```

 

**Constraints:**

	
- `n == nums.length`
	
- `1 <= n <= 1000`
	
- `1 <= nums[i] <= 1000`

## Tags

- Array
- Simulation

## Strat

Allocates a result array of length 2n, then fills each index i with nums[i % n], so the original array is repeated twice via modulo indexing.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution(object):
    def getConcatenation(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        n = len(nums)
        ans = [0] * (2 * n)
        for i in range(2*n):
            ans[i] = nums[i % n] 
        return ans
```
