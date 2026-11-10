---
id: 49
title: "Group Anagrams"
difficulty: "Medium"
category: "Arrays & Hashing"
---

# 49. Group Anagrams

**Difficulty:** Medium

Given an array of strings `strs`, group the anagrams together. You can return the answer in **any order**.

 

**Example 1:**

**Input:** strs = ["eat","tea","tan","ate","nat","bat"]

**Output:** [["bat"],["nat","tan"],["ate","eat","tea"]]

**Explanation:**

	
- There is no string in strs that can be rearranged to form `"bat"`.
	
- The strings `"nat"` and `"tan"` are anagrams as they can be rearranged to form each other.
	
- The strings `"ate"`, `"eat"`, and `"tea"` are anagrams as they can be rearranged to form each other.

**Example 2:**

**Input:** strs = [""]

**Output:** [[""]]

**Example 3:**

**Input:** strs = ["a"]

**Output:** [["a"]]

 

**Constraints:**

	
- `1 <= strs.length <= 10^4`
	
- `0 <= strs[i].length <= 100`
	
- `strs[i]` consists of lowercase English letters.

## Tags

- Array
- Hash Table
- String
- Sorting

## Strat

Each string is sorted to produce a canonical key, and strings sharing the same sorted key are appended to the same list in a hash map. The map's values are then returned as the groups of anagrams.

## Complexity

- Time: O(n * k log k)
- Space: O(n * k)

## Code

```python
class Solution:
    def groupAnagrams(self, strs: list[str]) -> list[list[str]]:
        map = defaultdict(list)
        for i in strs:
            sorted_str = "".join(sorted(i))
            map[sorted_str].append(i)
        return list(map.values())
```
