# Longest Substring Without Repeating Characters

Given a string s, find the length of the longest
substring without repeating characters.

## Tags

- Strings

## Strat

Maintain 2 pointers. While the right one is in the map, remove the left ones from the map and inc the left pointer. Then, add the right pointer char to the map and update the length.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        map = set()
        l, length = 0, 0
        for r in range(len(s)):
            while s[r] in map:
                map.remove(s[l])
                l+=1
            map.add(s[r])
            length = max(length, r-l+1)
        return length
```
