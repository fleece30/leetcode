---
id: 242
title: "Valid Anagram"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 242. Valid Anagram

**Difficulty:** Easy

Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.

 

**Example 1:**

**Input:** s = "anagram", t = "nagaram"

**Output:** true

**Example 2:**

**Input:** s = "rat", t = "car"

**Output:** false

 

**Constraints:**

	
- `1 <= s.length, t.length <= 5 * 10^4`
	
- `s` and `t` consist of lowercase English letters.

 

**Follow up:** What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

## Tags

- Hash Table
- String
- Sorting

## Strat

Checks that the strings have equal length, then uses a 26-element count array. For each index it increments the count for s's character and decrements the count for t's character. If every count ends at zero, the strings are anagrams.

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        h_table = [0] * 26
        
        if len(s) != len(t):
            return False

        for i in range(len(s)):
            s_ord, t_ord = ord(s[i]), ord(t[i])
            h_table[s_ord - 97] += 1
            h_table[t_ord - 97] -= 1

        for i in range(26):
            if h_table[i] != 0:
                return False

        return True
```
