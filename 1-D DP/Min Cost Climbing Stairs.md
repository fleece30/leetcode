# Min Cost Climbing Stairs
You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

## Tags
- DP

## Strat
From the end of the array, we can find the cost of taking 1 or 2 steps, which will be ```cost + cost of (i+1)``` and ```cost + cost of (i+2)```. We will start doing from ```len(cost) - 3``` index after adding 0 to the cost array as cost of staying at the top is 0. We keep going back and updating the cost of every step from the top by adding to it the min of (i+1) and (i+2) step. Finally, return min of cost of 0th step and 1st step.

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        cost.append(0)

        for i in range(len(cost) - 3, -1, -1):
            cost[i] += min(cost[i+1], cost[i+2])
        
        return min(cost[0], cost[1])
```