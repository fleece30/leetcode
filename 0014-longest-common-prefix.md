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

The provided code is an empty function stub with no implementation. A typical approach would compare characters of the strings column by column (or shrink a prefix taken from the first string) until a mismatch occurs.

## Complexity

- Time: O(1)
- Space: O(1)

## Code

```python
class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        
```
