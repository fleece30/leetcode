# Merge 2 sorted lists
You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

## Tags
- Linked Lists

## Strat
Create a dummy to get result lis started. While both lists have elements, check which one is smaller. Add that node to the next of the current list. When one of the list finishes, add the second list to the next of the result.

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
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        dummy = ListNode()
        temp = dummy
        while list1 and list2:
            if list1.val < list2.val:
                temp.next = list1
                list1 = list1.next
            else:
                temp.next = list2
                list2 = list2.next
            temp = temp.next
        
        if list1 == None:
            temp.next = list2
        if list2 == None:
            temp.next = list1
        return dummy.next
        
```