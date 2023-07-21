# Group Anagrams

Given an array of strings strs, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

## Tags
- Array
- Strings
- Hash Table

## Strat

Keep a hashmap where key is a list of size 26 with the count of each character of the current string. So, each string with the same characters will have the same list and the values for this map would be a list of all these strings.

eg. eat and ate will have list where 0th, 4th and 19th index is 1. Same list -> Anagrams

## Complexity

- Time: O(m*n) where m is size of input list and n is size of largest input string
- Space: O(m)

## Code

```python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        map = collections.defaultdict(list)

        for string in strs:
            count = [0] * 26
            for char in string:
                count[ord(char) - ord("a")] += 1
            map[tuple(count)].append(string)
        
        return map.values()
```