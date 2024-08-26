# Car Fleet
There are n cars traveling to the same destination on a one-lane highway.

You are given two arrays of integers position and speed, both of length n.

```position[i] is the position of the ith car (in miles) and speed[i] is the speed of the ith car (in miles per hour)```

The destination is at position target miles.

A car can not pass another car ahead of it. It can only catch up to another car and then drive at the same speed as the car ahead of it.

A car fleet is a non-empty set of cars driving at the same position and same speed. A single car is also considered a car fleet.

If a car catches up to a car fleet the moment the fleet reaches the destination, then the car is considered to be part of the fleet.

Return the number of different car fleets that will arrive at the destination.

## Tags
- Stack

## Strat
Save pair of position and speed. Loop through it in reverse sorted order. If the time taken by a car to reach the target is more than the one behind it, it means they will become one fleet as the one behind tries to overtake. So, add times to stack and check if the new time added is less than the last entry. If yes, pop this time as it will become one fleet with more time car and will travel at that speed. Len of stack at the end is the solution.

## Complexity

- Time: O(N)
- Space: O(N)

## Code

```python
class Solution:
    def carFleet(self, target: int, position: List[int], speed: List[int]) -> int:
        stack = []
        pair = [[p, s] for p,s in zip(position, speed)]

        for p, s in sorted(pair)[::-1]:
            time = (target - p) / s
            stack.append(time)

            if len(stack) >= 2 and stack[-1] <= stack[-2]:
                stack.pop()
        
        return len(stack)
```