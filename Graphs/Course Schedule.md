# Course Schedule
There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

    For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.

Return true if you can finish all courses. Otherwise, return false.

## Tags
- DFS
- Topological sort

## Strat
Keep prereqs of every course in a map. Start performing dfs on every node -> if a cycle is detected -> deadlock -> cant take courses. In dfs, check if the current node is already being visited -> loop -> False.

If the pre_req of curr is empty, that means it can be taken -> True

add curr to visiting, dfs on its prereqs, remove curr from visiting

`Optimization: In the main loop, if dfs of curr doesnt return False, means it can be taken -> set its prereqs to [] -> no computations if that node is visted again in dgs of some other node -> can just return True from dfs function`

## Complexity

- Time: O(V + E)
- Space: O(n)

## Code

```python
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        pre_req = {i: [] for i in range(numCourses)}
        for crs, pre in prerequisites:
            pre_req[crs].append(pre)

        visiting = set()

        def dfs(curr):
            if curr in visiting:
                return False
            if pre_req[curr] == []:
                return True
            
            visiting.add(curr)
            for pre in pre_req[curr]:
                if not dfs(pre):
                    return False
            visiting.remove(curr)
            return True

        for curr in range(numCourses):
            if not dfs(curr):
                return False
            else:
                pre_req[curr] = []
        return True
```