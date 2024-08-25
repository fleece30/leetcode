# Longest Repeating Character Replacement
You are given a string s consisting of only uppercase english characters and an integer k. You can choose up to k characters of the string and replace them with any other uppercase English character.

After performing at most k replacements, return the length of the longest substring which contains only one distinct character.

## Tags
- Sliding window

## Strat
Make a window and keep map of number of characters in that window and the maxCount of any character. While the (window size - maxCount) is greater than k, there will be duplicate characters in the window after k replacements. So, while this is true, increase left pointer and reduce count of s[l] in the map. Finally, update res 

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def characterReplacement(self, s: str, k: int) -> int:
        l = 0
        maxCount = 0
        charMap = {}
        res = 0

        for r in range(len(s)):
            if s[r] in charMap:
                charMap[s[r]] += 1
            else:
                charMap[s[r]] = 1

            maxCount = max(maxCount, charMap[s[r]])
            
            while (r - l + 1) - maxCount > k:
                charMap[s[l]] -= 1
                l += 1
            
            res = max(res, r - l + 1)

        return res
```