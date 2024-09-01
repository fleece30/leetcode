# K Closest Points to Origin
Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).

The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)2 + (y1 - y2)2).

You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).

## Tags
- Max heap

## Strat
Add k (-dist, point) to heap, creating a max heap. Now, for every point after k, check if its distance is less than the max in the heap. If so, remove that an and the lesser dist point. In the end, return points from the heap 

## Complexity

- Time: O(n log k)
- Space: O(k)

## Code

```python
class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        heap = []

        def getDist(x, y):
            return x * x + y * y

        for i in range(k):
            dist = getDist(points[i][0], points[i][1])
            heapq.heappush(heap, (-dist, points[i]))
        
        for i in range(k, len(points)):
            dist = getDist(points[i][0], points[i][1])
            if dist < -heap[0][0]:
                heapq.heappop(heap)
                heapq.heappush(heap, (-dist, points[i]))
        
        return [point for (_, point) in heap]
```