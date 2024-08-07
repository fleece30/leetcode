# Meeting Schedule
Given an array of meeting time interval objects consisting of start and end times [[start_1,end_1],[start_2,end_2],...] (start_i < end_i), determine if a person could add all meetings to their schedule without any conflicts.

## Tags
- Intervals

## Strat
Sort by start time. Check if any prev end times are greater than curr start times. if so, return false

## Complexity

- Time: O(nlogn) cos of sorting
- Space: O(1)

## Code

```python
"""
Definition of Interval:
class Interval(object):
    def __init__(self, start, end):
        self.start = start
        self.end = end
"""

class Solution:
    def canAttendMeetings(self, intervals: List[Interval]) -> bool:
        intervals.sort(key=lambda i: i.start)
        
        for i in range(1, len(intervals)):
            prev = intervals[i-1]
            curr = intervals[i]

            if prev.end > curr.start:
                return False
        
        return True
```