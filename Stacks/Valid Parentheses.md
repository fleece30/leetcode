# Valid Parentheses

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

- Open brackets must be closed by the same type of brackets.
- Open brackets must be closed in the correct order.
- Every close bracket has a corresponding open bracket of the same type.


## Tags
- String
- Stack

## Strat

Keep a dict of pairs. If opening Parentheses, add to main stack. If closing, check if stack is empty or the top of the stack is not the corresponding opening one. If any of these conditions are met, that means, its a sole closing Parentheses, so return false.
Finally, return true

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def isValid(self, s: str) -> bool:
        stack = collections.deque()
        pairs = {
            '(': ')',
            '{': '}',
            '[': ']'
        }

        for char in s:
            if char == '(' or char == '{' or char == '[':
                stack.append(char)
            else:
                if not stack or pairs[stack[-1]] != char:
                    return False
                stack.pop()
        
        return True if not stack else False

```