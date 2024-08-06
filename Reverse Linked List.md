# Reverse Linked List
Given the head of a singly linked list, reverse the list, and return the reversed list.

## Tags
- Linked Lists

## Strat
Init 2 pointers prev(Null) and curr(head). Update pointers for these until curr becomes null. The prev would be the last element of the original list and head of the reversed one. Return that

## Complexity

- Time: O(n)
- Space:  O(1)

## Code

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        prev, curr = None, head
        while curr != None:
            temp = curr.next
            curr.next = prev
            prev = curr
            curr = temp
        return prev

```