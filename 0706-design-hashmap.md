---
id: 706
title: "Design HashMap"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 706. Design HashMap

**Difficulty:** Easy

Design a HashMap without using any built-in hash table libraries.

Implement the `MyHashMap` class:

	
- `MyHashMap()` initializes the object with an empty map.
	
- `void put(int key, int value)` inserts a `(key, value)` pair into the HashMap. If the `key` already exists in the map, update the corresponding `value`.
	
- `int get(int key)` returns the `value` to which the specified `key` is mapped, or `-1` if this map contains no mapping for the `key`.
	
- `void remove(key)` removes the `key` and its corresponding `value` if the map contains the mapping for the `key`.

 

**Example 1:**

```

**Input**
["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
[[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
**Output**
[null, null, null, 1, -1, null, 1, null, -1]

**Explanation**
MyHashMap myHashMap = new MyHashMap();
myHashMap.put(1, 1); // The map is now [[1,1]]
myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]

```

 

**Constraints:**

	
- `0 <= key, value <= 10^6`
	
- At most `10^4` calls will be made to `put`, `get`, and `remove`.

## Tags

- Array
- Hash Table
- Linked List
- Design
- Hash Function

## Strat

Implements a hash map using separate chaining: a fixed array of 1009 buckets, each a list of [key, value] pairs. A key is hashed with key % 1009 to pick its bucket, and put, get and remove scan that bucket linearly to update, find or delete the entry.

## Complexity

- Time: O(n/k) average per operation, where n is the number of stored keys and k = 1009 buckets; O(n) worst case
- Space: O(n + k)

## Code

```python
class MyHashMap:

    def __init__(self):
       self.size = 1009
       self.arr = [[] for _ in range(self.size)]
    
    def _get_index(self, key: int):
        return key % self.size

    def put(self, key: int, value: int) -> None:
        index = self._get_index(key)
        for i in self.arr[index]:
            if i[0] == key:
                i[1] = value
                return
        self.arr[index].append([key, value])

    def get(self, key: int) -> int:
        index = self._get_index(key)
        for i in self.arr[index]:
            if i[0] == key:
                return i[1]
        return -1
        
    def remove(self, key: int) -> None:
        index = self._get_index(key)
        for idx, i in enumerate(self.arr[index]):
            if i[0] == key:
                self.arr[index].pop(idx)



# Your MyHashMap object will be instantiated and called as such:
# obj = MyHashMap()
# obj.put(key,value)
# param_2 = obj.get(key)
# obj.remove(key)
```
