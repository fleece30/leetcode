# Contains Duplicate

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

## Tags
- Array
- Hash Table

## Strat

Create a set, start adding elements. If any already exists in the set, return True. Else, outside of loop, return False

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        hashset = set()
        for i in nums:
            if i in hashset: 
                return True
            hashset.add(i)
        return False
```