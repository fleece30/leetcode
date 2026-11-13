---
id: 705
title: "Design HashSet"
difficulty: "Easy"
category: "Arrays & Hashing"
---

# 705. Design HashSet

**Difficulty:** Easy

Design a HashSet without using any built-in hash table libraries.

Implement `MyHashSet` class:

	
- `void add(key)` Inserts the value `key` into the HashSet.
	
- `bool contains(key)` Returns whether the value `key` exists in the HashSet or not.
	
- `void remove(key)` Removes the value `key` in the HashSet. If `key` does not exist in the HashSet, do nothing.

 

**Example 1:**

```

**Input**
["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
[[], [1], [2], [1], [3], [2], [2], [2], [2]]
**Output**
[null, null, null, true, false, null, true, null, false]

**Explanation**
MyHashSet myHashSet = new MyHashSet();
myHashSet.add(1);      // set = [1]
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(1); // return True
myHashSet.contains(3); // return False, (not found)
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(2); // return True
myHashSet.remove(2);   // set = [1]
myHashSet.contains(2); // return False, (already removed)
```

 

**Constraints:**

	
- `0 <= key <= 10^6`
	
- At most `10^4` calls will be made to `add`, `remove`, and `contains`.

## Tags

- Array
- Hash Table
- Linked List
- Design
- Hash Function

## Strat

Implements a hash set using separate chaining: 1009 buckets, each a list. A key is hashed with key % 1009 to pick a bucket, then add, remove, and contains scan that bucket's list linearly. Add skips duplicates.

## Complexity

- Time: O(n/k) average per operation, where k=1009 buckets; O(n) worst case
- Space: O(n + k)

## Code

```python
class MyHashSet:

    def __init__(self):
        self.size = 1009
        self.arr = [[] for _ in range(self.size)]

    def add(self, key: int) -> None:
        index = key % self.size
        for i in self.arr[index]:
            if i == key:
                return
        self.arr[index].append(key)

    def remove(self, key: int) -> None:
        index = key % self.size
        for idx, i in enumerate(self.arr[index]):
            if i == key:
                self.arr[index].pop(idx)


    def contains(self, key: int) -> bool:
        index = key % self.size
        for i in self.arr[index]:
            if i == key:
                return True
        return False


# Your MyHashSet object will be instantiated and called as such:
# obj = MyHashSet()
# obj.add(key)
# obj.remove(key)
# param_3 = obj.contains(key)
```
