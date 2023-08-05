# Daily Temperatures

Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

## Tags

- Monotoic stack

## Strat

Monotonic stack is when the stack values are either always increasing or decreasing. So, we start from the beginning, and keep the stack monotonically decreasing by popping values lesser than the current one before adding it. For each value we remove, we will have the next greatest value for that as the current one. So, the difference in days would be the difference in index of value being popped and the current index. We add these to the correct index in the result array.

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        res, stack = [0] * len(temperatures), collections.deque()
        for i, t in enumerate(temperatures):
            while stack and stack[-1][0] < t:
                stackTemp, stackIndex = stack.pop()
                res[stackIndex] = i - stackIndex
            stack.append([t, i])
        return res
```
