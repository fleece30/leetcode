---
id: 14
title: "Longest Common Prefix"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 14. Longest Common Prefix

**Difficulty:** Easy

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string `""`.

 

**Example 1:**

```

**Input:** strs = ["flower","flow","flight"]
**Output:** "fl"

```

**Example 2:**

```

**Input:** strs = ["dog","racecar","car"]
**Output:** ""
**Explanation:** There is no common prefix among the input strings.

```

 

**Constraints:**

	
- `1 <= strs.length <= 200`
	
- `0 <= strs[i].length <= 200`
	
- `strs[i]` consists of only lowercase English letters if it is non-empty.

## Tags

- Array
- String
- Trie

## Strat

Take the first string as reference and scan it character by character. For each index, compare that character against the same index in every other string. Return the prefix up to that index as soon as any string is too short or has a different character; if no mismatch is found, the whole first string is the prefix.

## Complexity

- Time: O(S) where S is the total number of characters across all strings (worst case O(n*m))
- Space: O(1)

## Code

```python
class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:
        first = strs[0]
        for i in range(len(first)):
            c = first[i]
            for s in strs[1:]:
                if i == len(s) or s[i] != c:
                    return first[:i]
        return first
```
