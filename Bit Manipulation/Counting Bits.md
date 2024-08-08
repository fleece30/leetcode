# Counting Bits
Given an integer n, count the number of 1's in the binary representation of every number in the range [0, n].

Return an array output where output[i] is the number of 1's in the binary representation of i.

## Tags
- Bit Manipulation
- DP

## Strat
0 - 0000 - 1 + dp[n-1]
1 - 0001 - 1 + dp[n-2]
2 - 0010 - 1 + dp[n-2]
4 - 0100 - 1 + dp[n-4]
3 - 0011 - 1 + dp[n-4]
5 - 0101 - 1 + dp[n-4]
6 - 0110 - 1 + dp[n-4]
7 - 0111 - 1 + dp[n-4]
8 - 1000 - 1 + dp[n-8]

When offset (most significant bit) changes, 1 more `1` is added and the rest is repeated from the values in the last iteration of significant bits. Offset changes at 1, 2, 4, 8, 16 ...

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def countBits(self, n: int) -> List[int]:
        dp = [0] * (n+1)
        offset = 1

        for i in range(1, n+1):
            if offset * 2 == i:
                offset = i
            dp[i] = 1 + dp[i - offset]
        
        return dp
```