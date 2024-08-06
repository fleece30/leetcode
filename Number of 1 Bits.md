# Number of 1 Bits
Write a function that takes the binary representation of a positive integer and returns the number of
set bits
it has (also known as the Hamming weight).

## Tags
- Bit manipulation

## Strat

## Complexity

- Time: O(1)
- Space: O(1)

## Code

```python
class Solution:
    def hammingWeight(self, n: int) -> int:
        answer = 0
        while n:
            answer += n & 1
            # or answer += n % 2. Both will return 1 if last bit is one and 0 if last bit is 0
            n >>= 1 # Right bit shift
        return answer
```


```python
class Solution:
    def hammingWeight(self, n: int) -> int:
        answer = 0
        while n:
            n = n & (n-1)
            answer += 1
        return answer
```