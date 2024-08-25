# Permutation in String
Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

In other words, return true if one of s1's permutations is the substring of s2.

## Tags
- Sliding Window

## Strat
Keep map of s1 chars, create a substrmap of len(s1) chars of s2. Now run a loop from len(s1) to len(s2), adding incoming char to substrmap and removing leftmost char to keep window size to len(s1). If the maps match, return true

## Complexity

- Time: O(len(s2))
- Space: O(1) 

## Code

```python
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        if len(s2) < len(s1):
            return False
            
        s1Map = {}
        for s in s1:
            if s in s1Map:
                s1Map[s] += 1
            else:
                s1Map[s] = 1

        subStrMap = {}
        for i in range(len(s1)):
            if s2[i] in subStrMap:
                subStrMap[s2[i]] += 1
            else:
                subStrMap[s2[i]] = 1
            
        
        for l in range(len(s1), len(s2)):
            if subStrMap == s1Map:
                return True

            subStrMap[s2[l - len(s1)]] -= 1
            if subStrMap[s2[l - len(s1)]] == 0: 
                del subStrMap[s2[l - len(s1)]]

            if s2[l] in subStrMap:
                subStrMap[s2[l]] += 1
            else:
                subStrMap[s2[l]] = 1

        return subStrMap == s1Map
```