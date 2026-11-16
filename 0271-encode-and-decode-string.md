---
id: 271
title: "Encode and Decode Strings"
difficulty: "Medium"
category: "Arrays & Hashing"
---

# 271. Encode and Decode Strings

**Difficulty:** Medium

Design an algorithm to encode **a list of strings** to **a string**. The encoded string is then sent over the network and is decoded back to the original list of strings.

Implement the `encode` and `decode` methods:

- `string encode(vector<string> strs)` encodes a list of strings to a single string.
- `vector<string> decode(string s)` decodes a single string back to the original list of strings.

The decoded list must be exactly equal to the original list. Note that the strings may contain any possible characters out of 256 valid ASCII characters, so you must not rely on any particular character as a delimiter. Your encode and decode algorithms should be stateless.

**Example 1:**

**Input:** strs = ["Hello","World"]

**Output:** ["Hello","World"]

**Explanation:**
Machine 1:
Codec encoder = new Codec();
String msg = encoder.encode(strs);
Machine 1 ---msg---> Machine 2

Machine 2:
Codec decoder = new Codec();
String[] strs2 = decoder.decode(msg);

**Example 2:**

**Input:** strs = [""]

**Output:** [""]

**Constraints:**

- `0 <= strs.length < 100`
- `0 <= strs[i].length < 200`
- `strs[i]` contains any possible characters out of 256 valid ASCII characters.

**Follow up:** Could you write a generalized algorithm to work on any possible set of characters?

## Tags

- Array
- String
- Design

## Strat

Encode each string as its length, a '#' delimiter, then the string itself, and concatenate everything. To decode, read digits up to the next '#' to get the length, then slice exactly that many characters as the next string and continue from there. Since the length is read first, '#' characters inside strings do not cause ambiguity.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:

    def encode(self, strs: list[str]) -> str:
        res = []
        for s in strs:
            res.append(str(len(s)))
            res.append("#")
            res.append(s)
        return "".join(res)


    def decode(self, s: str) -> list[str]:
        res = []
        i = 0

        while i < len(s):
            j = i
            while s[j] != "#":
                j += 1
            size = int(s[i:j])
            i = j + 1
            j = i + size
            res.append(s[i:j])
            i = j
        
        return res
```
