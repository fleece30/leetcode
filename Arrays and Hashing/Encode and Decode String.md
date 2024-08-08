# Encode and Decode String
Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of strings.

Please implement encode and decode

## Tags
- Design

## Strat
Encode `abhishek` as `8#abhishek` -> `len(s)#s`
Decode -> look for delimiter `#`. Anything before that is the length of the word -> get that work and update index to the char after the word ends

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:

    def encode(self, strs: List[str]) -> str:
        encoded_string = ""
        for string in strs:
            encoded_string += str(len(string)) + "#" + string
        return encoded_string

    def decode(self, s: str) -> List[str]:
        ans, curr = [], 0

        while curr < len(s):
            delim_idx = curr
            while s[delim_idx] != "#":
                delim_idx += 1
            length = int(s[curr:delim_idx])
            word = s[delim_idx + 1:delim_idx + length + 1]
            ans.append(word)
            curr = delim_idx + length + 1
        
        return ans

```