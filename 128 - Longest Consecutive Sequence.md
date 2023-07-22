# Longest Consecutive Sequence

Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time.

## Tags
- Array
- Hash Table

## Strat

Convert to set. Any element would be the start of a sequence if it has no left neighbour i.e. (num-1) doesnt exist in the set. So, we use this to find the starts. After a start is found, we iterate while (num + length of subsequence) exists in the map and update the local length of subsequence. Finally, after no more consequtive elements are found, we update the global longest length.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        hashset = set(nums)
        longestLen = 0
        
        for i in nums:
            if (i-1) not in hashset:
                length = 0
                while(i+length) in hashset:
                    length+=1
                longestLen = max(longestLen, length)
        
        return longestLen
```