# Valid Palindrome
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

## Tags
- Two pointers
- Strings

## Strat
Remove non-alphanumerci chars from string using regex and them run two points from front and back to check if corresponding chars are equal

## Complexity

- Time: O(len(s))
- Space: O(1)

## Code

```python
class Solution:
def isPalindrome(self, s: str) -> bool:
    s = s.lower()
    s = re.sub(r'[^a-zA-Z0-9]', '', s)
    low, high = 0, len(s) - 1
    while(low < high):
        if s[low] != s[high]:
            return False
        low += 1
        high -= 1
    return True
```