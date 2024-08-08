# Climbing Stairs

You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

## Tags
- DP
- Memoization

## Strat

Keep a dp array to track subproblem answers and progress accordingly

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    dp = {}
    def climbStairs(self, n: int) -> int:
        if n in self.dp:
            return self.dp[n]
        if n == 2 or n == 1:
            return n
        self.dp[n] = self.climbStairs(n-1) + self.climbStairs(n-2)
        return self.dp[n]
```