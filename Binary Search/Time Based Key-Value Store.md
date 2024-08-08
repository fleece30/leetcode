# Time Based Key-Value Store

Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.

Implement the TimeMap class:

- TimeMap() Initializes the object of the data structure.
- void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
- String get(String key, int timestamp) Returns a value such that set was called previously, with timestamp_prev <= timestamp. If there are multiple such values, it returns the value associated with the largest timestamp_prev. If there are no values, it returns "".

## Tags

- Binary Search
- Hash table

## Strat

Add to map as key and list of tuples as values. In get, run binary search of key's values to find the largest num less than target

## Complexity

- Time: O(log n)
- Space: O(n)

## Code

```python
class TimeMap:
    def __init__(self):
        self.timeMap = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        if key not in self.timeMap:
            self.timeMap[key] = []
        self.timeMap[key].append([timestamp, value])


    def get(self, key: str, timestamp: int) -> str:
        tempKeyStore = self.timeMap.get(key, [])
        low, high = 0, len(tempKeyStore) - 1
        res = ""
        while low <= high:
            mid = (low + high) // 2
            if timestamp == tempKeyStore[mid][0]:
                return tempKeyStore[mid][1]
            if timestamp >= tempKeyStore[mid][0]:
                res = tempKeyStore[mid][1]
                low = mid+1
            else:
                high = mid - 1
        return res



# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap()
# obj.set(key,value,timestamp)
# param_2 = obj.get(key,timestamp)
```
