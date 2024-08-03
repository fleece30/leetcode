# Best Time to Buy and Sell Stock

You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

## Tags

- Arrays

## Strat

Init 2 pointers at first and second indices. Whenever there is an uptick, find profit and update using max profit

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        left, right = 0, 1
        maxProfit = 0
        while right < len(prices):
            if prices[left] >= prices[right]:
                left = right
            else:
                profit = prices[right] - prices[left]
                maxProfit = max(profit, maxProfit)
            right+=1

        return maxProfit
```
