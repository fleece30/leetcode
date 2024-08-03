# Contains Duplicate

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

## Tags
- Array
- Hash Table

## Strat

Create a set, add all elements. Return len(hashset) != len(nums)

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        hashset = set()
        for i in nums:
            hashset.add(i)
        return len(hashset) != len(nums)
```