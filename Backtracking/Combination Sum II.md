# Combination Sum II
Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.

## Tags
- Backtracking

## Strat
Sort the input to group same elements together. Do normal combination sum. In the branch that a certain number is not included, skip all its occurances as any permutation containing that number would be covered in the tree where that number was selected.

## Complexity

- Time: O(2^n)
- Space: O(2^n)

## Code

```python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []
        candidates.sort()

        def backtrack(start, curr, total):
            if total == target:
                res.append(curr[:])
                return
            
            if start >= len(candidates) or total > target:
                return
            
            curr.append(candidates[start])
            backtrack(start + 1, curr, total + candidates[start])
            curr.pop()
            while start + 1 < len(candidates) and candidates[start + 1] == candidates[start]:
                start += 1
            backtrack(start + 1, curr, total)
        

        backtrack(0, [], 0)
        return res
```