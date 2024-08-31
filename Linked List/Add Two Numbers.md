# Add Two Numbers
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

## Tags
- Linked list

## Strat
Just add

## Complexity

- Time: O(n)
- Space: O(n)

## Code

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        res = ListNode(0)
        self.dummy, self.carry = res, 0

        def add(val1, val2):
            add = ListNode(0)
            add.val = (val1 + val2 + self.carry) % 10
            self.carry = (val1 + val2 + self.carry) // 10
            self.dummy.next = add
            self.dummy = self.dummy.next

        while l1 or l2:
            val1, val2 = l1.val if l1 else 0, l2.val if l2 else 0
            add(val1, val2)
            if l1:
                l1 = l1.next
            if l2:
                l2 = l2.next

        if self.carry == 1:
            self.dummy.next = ListNode(1)

        return res.next
```