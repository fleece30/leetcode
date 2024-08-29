# Remove Nth Node From End of List
Given the head of a linked list, remove the nth node from the end of the list and return its head.

## Tags
- Two pointers

## Strat
Go to the nth node and then start incrementing both temp(head) and dummy. When dummy reaches the end, temp will be prev to the node to be deleted.

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
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        dummy, temp = head, head
        for i in range(n):
            dummy = dummy.next
        if not dummy:
            return head.next
        while dummy.next:
            temp = temp.next
            dummy = dummy.next
        
        temp.next = temp.next.next
        return head
```