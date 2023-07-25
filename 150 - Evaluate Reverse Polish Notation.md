# Evaluate Reverse Polish Notation

You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.

Evaluate the expression. Return an integer that represents the value of the expression.

Note that:

- The valid operators are '+', '-', '*', and '/'.
- Each operand may be an integer or another expression.
- The division between two integers always truncates toward zero.
- There will not be any division by zero.
- The input represents a valid arithmetic expression in a reverse polish notation.
- The answer and all the intermediate calculations can be represented in a 32-bit integer.



## Tags
- Stack
- Postfix evaluation

## Strat

Basic postfix eval. If int, push to stack. If operator, remove 2 from stack, perform operation and add the result.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        stack = collections.deque()
        for s in tokens:
            if s.isnumeric() or (s[0] == '-' and s[1:].isnumeric()):
                stack.append(int(s))
            else:
                op1 = stack.pop()
                op2 = stack.pop()
                if s == '+':
                    stack.append(op1 + op2)
                elif s == '-':
                    stack.append(op2 - op1)
                elif s == '/':
                    stack.append(int(op2 / op1))
                elif s == '*':
                    stack.append(op1 * op2)
        
        return stack[0]
```