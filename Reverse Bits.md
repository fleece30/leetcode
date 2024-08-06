# Reverse Bits
Reverse bits of a given 32 bits unsigned integer.

## Tags
- Bit Manipulation

## Strat
Find last bit in num and then right shift it to move it to next bit. Left shif thte answer to make space for new bit on the right and then take `or` with the last bit to add that

## Complexity

- Time: O(1)
- Space: O(1)

## Code

```python
class Solution:
    def reverseBits(self, n: int) -> int:
        answer = 0
        for i in range(32):
            last_bit = n & 1
            n >>= 1 # Right shift
            answer <<= 1
            answer = answer | last_bit
        return answer
```