# Top K Frequent Elements

Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

## Tags
- Array
- Hash Table
- Bucket Sort

## Strat

Add all elements to a map and the create an array of arrays where the index is the frequency of the numbers contained on that index. Now run a backward loop and keep adding elements from each index until len(result) == k

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        map = {}
        for i in nums:
            map[i] = 1 + map.get(i, 0)
        
        bucket, result = [[] for i in range(len(nums) + 1)], []
        for key,v in map.items():
            bucket[v].append(key)
            
        for i in range(len(bucket) - 1, 0, -1):
            for n in bucket[i]:
                result.append(n)
                print(len(result))
                if len(result) == k:
                    return result
```