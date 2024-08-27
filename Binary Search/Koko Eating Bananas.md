# Koko Eating Bananas
Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.

Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.

Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

Return the minimum integer k such that she can eat all the bananas within h hours.

## Tags
- Binary Search

## Strat
Min speed is 1 and max is size of largest pile. Binary search for speed. For each speed, calc hours to finish pile and update speed as required.

## Complexity

- Time: O(nlogn)
- Space: O(1)

## Code

```python
class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        def findMax(piles):
            maxPile = 0
            for pile in piles:
                maxPile = max(maxPile, pile)
            return maxPile

        def simulateEating(piles, k):
            # Return hours taken to eat with this speed
            hours = 0
            for pile in piles:
                hours += math.ceil(pile / k)
            
            return hours


        low, high = 1, findMax(piles)
        res = high
        while low <= high:
            mid = low + (high - low) // 2
            hours = simulateEating(piles, mid)
            if hours > h:
                low = mid + 1
            else:
                res = mid
                high = mid - 1
        
        return res
```