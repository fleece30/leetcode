# Find Minimum in Rotated Sorted Array
You are given an array of length n which was originally sorted in ascending order. It has now been rotated between 1 and n times. For example, the array nums = [1,2,3,4,5,6] might become:

    [3,4,5,6,1,2] if it was rotated 4 times.
    [1,2,3,4,5,6] if it was rotated 6 times.

Notice that rotating the array 4 times moves the last four elements of the array to the beginning. Rotating the array 6 times produces the original array.

Assuming all elements in the rotated sorted array nums are unique, return the minimum element of this array.

A solution that runs in O(n) time is trivial, can you write an algorithm that runs in O(log n) time?

## Tags
- Binary Search

## Strat
Perform binary search like normal. If mid is less than prev element, that means thats where the sorted array ended and mid is the answer. Otherwise, if mid is greater than last element, that means min element is somewhere between mid and last. Otherwise, between low and mid.

## Complexity

- Time: O(logn)
- Space: O(1)

## Code

```python
class Solution:
    def findMin(self, nums: List[int]) -> int:
        low, high = 0, len(nums) - 1

        while low <= high:
            mid = low + (high - low) // 2
            if nums[mid] < nums[mid - 1]:
                return nums[mid]
            elif nums[mid] > nums[high]:
                low = mid + 1
            else:
                high = mid - 1

        return nums[mid]
```