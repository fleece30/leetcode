# Reorder List
You are given the head of a singly linked-list. The list can be represented as:

```L0 → L1 → … → Ln - 1 → Ln```

Reorder the list to be on the following form:

```L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …```

You may not modify the values in the list's nodes. Only nodes themselves may be changed.

## Tags
- Two pointers

## Strat
Find middle, reverse second half and merge

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def reorderList(self, head: Optional[ListNode]) -> None:
        # Find middle
        slow, fast = head, head
        while fast.next and fast.next.next:
            slow = slow.next
            fast = fast.next.next
        
        # Slow is the middle and fast.next is the tail
        # reverse list from tail to mid
        
        prev, curr = slow, slow.next
        slow.next = None
        while curr != None:
            temp = curr.next
            curr.next = prev
            prev = curr
            curr = temp

        # Prev is the head of the reversed list now
        # Now merge
        temp = head
        while temp:
            tempNext = temp.next
            temp.next = prev
            prev = prev.next
            temp.next.next = tempNext
            temp = tempNext
```