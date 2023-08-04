# Generate Parentheses

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

## Tags

- Stack
- Backtracking

## Strat

3 conditions need to be followed:

- If closed and open counts are equal to input num, that means we have a valid config and we return
- If open count is less than n, we can add an open count and run the Backtracking function again
- If closed count is less than open count, we can generate a permutation by adding a closing parentheses

## Complexity

- Time: O(2^n) since at each point, we have 2 options - to add an opening parentheses or a closing one
- Space: O(n)

## Code

```python
class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        stack = []
        result = []

        def backtracking(openCount, closedCount):
            if openCount == closedCount == n:
                result.append("".join(stack))
                return

            if openCount < n:
                stack.append("(")
                backtracking(openCount+1, closedCount)
                stack.pop()

            if closedCount < openCount:
                stack.append(")")
                backtracking(openCount, closedCount+1)
                stack.pop()

        backtracking(0, 0)
        return result
```
