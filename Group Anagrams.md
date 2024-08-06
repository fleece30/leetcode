# Group Anagrams

Given an array of strings strs, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

## Tags
- Array
- Strings
- Hash Table

## Strat

Sort every string, save in hashmap with sorted value as key. Retrun values in the hashmaps appended in a list

## Complexity

- Time: O(n * k log k) where n is size of input list and k is the length of longest string
- Space: O(n)

## Code

```python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        res = []
        hash_map = {}
        for string in strs:
            sorted_str = ''.join(sorted(string))
            if sorted_str in hash_map:
                hash_map[sorted_str].append(string)
            else:
                hash_map[sorted_str] = [string]
        for key in hash_map:
            res.append(hash_map[key])
        return res
```