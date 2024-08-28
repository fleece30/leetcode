# Last Stone Weight
You are given an array of integers stones where stones[i] is the weight of the ith stone.

We are playing a game with the stones. On each turn, we choose the heaviest two stones and smash them together. Suppose the heaviest two stones have weights x and y with x <= y. The result of this smash is:

    If x == y, both stones are destroyed, and
    If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.

At the end of the game, there is at most one stone left.

Return the weight of the last remaining stone. If there are no stones left, return 0.

## Tags
- Max Heap

## Strat
Create a max heap by inserting -ve of weights in heapq, pop 2 stones and append their weight diff.

## Complexity

- Time: O(nlogn)
- Space: O(nlogn)

## Code

```python
class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        heap = []

        for stone in stones:
            heapq.heappush(heap, -stone)

        while len(heap) > 1:
            s1 = heapq.heappop(heap) * -1
            s2 = heapq.heappop(heap) * -1
            heapq.heappush(heap, s2 - s1)
        
        return -heap[0] if len(heap) != 0 else 0
```