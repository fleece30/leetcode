# Kth Largest Element in an Array
Given an integer array nums and an integer k, return the kth largest element in the array.

Note that it is the kth largest element in the sorted order, not the kth distinct element.

Can you solve it without sorting?

## Tags
- Mix heap

## Strat
Keep min heap of size k. After iterating through all elements, the num at the root of heap will be the kth smallest.

## Complexity

- Time: O(n logk)
- Space: O(k)

## Code

```python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        heap = []

        for i in range(k):
            heapq.heappush(heap, nums[i])
            
        for i in range(k, len(nums)):
            if nums[i] > heap[0]:
                heapq.heappop(heap)
                heapq.heappush(heap, nums[i])
        
        return heap[0]
```
