# Find the Duplicate Number
Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

There is only one repeated number in nums, return this repeated number.

You must solve the problem without modifying the array nums and uses only constant extra space.

## Tags
- Linked lists
- Floyd's cycle

## Strat
Find intersection of slow and fast pointers (nums[slow], nums[nums[fast]]). Then run another slow pointer from start and find intersection of the 2 slow pointers. 

## Complexity

- Time: O(n)
- Space: O(1)

## Code

```python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        slow, fast = 0, 0
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break
        
        slow2 = 0
        while True:
            slow = nums[slow]
            slow2 = nums[slow2]
            if slow == slow2:
                break

        return slow

```