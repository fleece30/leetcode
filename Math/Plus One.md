# Plus One
You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.

## Tags
- Math

## Strat
Start from end, while 9, make 0 and dec. If index less than 0 -> append 1 to beg, else add 1 to index

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        i = len(digits) - 1

        if digits[i] < 9:
            digits[i] += 1
            return digits
        
        while i >= 0 and digits[i] == 9:
            digits[i] = 0
            i -= 1
        
        if i < 0:
            digits[0] = 1
            digits.append(0)
        else:
            digits[i] += 1
        
        return digits
```