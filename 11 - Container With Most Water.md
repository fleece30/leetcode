# Container With Most Water

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

## Tags

- Array
- Two pointers

## Strat

Take 2 pointers, and for each pair, calc the water content as (diff between height \* diff between positions i.e. width). Take max of original water content and this. Now, whichever pointer has lower height, update it accordingly

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def maxArea(self, height: List[int]) -> int:
        start, end, water = 0, len(height) - 1, 0
        while start <= end:
            water = max(water, min(height[start], height[end]) * (end - start))
            if height[start] >= height[end]:
                end-=1
            else:
                start+=1

        return water
```
