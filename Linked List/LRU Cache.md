# LRU Cache
Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

Implement the LRUCache class:

    LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
    int get(int key) Return the value of the key if the key exists, otherwise return -1.
    void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

The functions get and put must each run in O(1) average time complexity.

## Tags
- Double Linked List

## Strat
Keep left and right pointers and all keys between them. Left points to least recently used key and right to most recently used. When key is used, remove and add to right. If cap exceeded, remove left.

## Complexity

- Time: O(1)
- Space: O(n)

## Code

```python
class KeyNode:
    def __init__(self, key: int, val: int):
        self.val = val
        self.key = key
        self.next = None
        self.prev = None

class LRUCache:
    def __init__(self, capacity: int):
        self.cache = {}
        self.capacity = capacity
        self.left, self.right = KeyNode(0,0), KeyNode(0,0)
        self.left.next, self.right.prev = self.right, self.left

    def evict(self, node):
        prev, nxt = node.prev, node.next
        prev.next, nxt.prev = nxt, prev
    
    def insert(self, node):
        self.right.prev.next = node
        node.prev = self.right.prev
        node.next = self.right
        self.right.prev = node

    def get(self, key: int) -> int:
        if key in self.cache:
            self.evict(self.cache[key])
            self.insert(self.cache[key])
            return self.cache[key].val
        return -1

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            self.evict(self.cache[key])
        self.cache[key] = KeyNode(key, value)
        self.insert(self.cache[key])

        if len(self.cache) > self.capacity:
            lru = self.left.next
            self.evict(lru)
            del self.cache[lru.key]

```