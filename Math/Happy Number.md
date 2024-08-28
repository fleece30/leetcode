# Happy Number
Write an algorithm to determine if a number n is happy.

A happy number is a number defined by the following process:

    Starting with any positive integer, replace the number by the sum of the squares of its digits.
    Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
    Those numbers for which this process ends in 1 are happy.

Return true if n is a happy number, and false if not.

## Tags
- Math

## Strat
Get digit squares, store in set, compare with 1

## Complexity

- Time: O(logn)
- Space: O(logn)

## Code

```python
class Solution:
    def isHappy(self, n: int) -> bool:
        seen = set()

        def getDigitSquare(n: int) -> int:
            res = 0
            while n >= 1:
                digit = n % 10
                n //= 10
                res += digit * digit
            return res
        
        i = getDigitSquare(n)

        while i not in seen:
            if i == 1:
                return True
            seen.add(i)
            i = getDigitSquare(i)

        return False
```