from collections import defaultdict, deque


class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

    def addEdge(self, src, dest):
        self.graph[src].append(dest)

    def DFS(self, start):
        stack = deque([start])
        visited = set()
        while stack:
            current = stack.pop()
            if current not in visited:
                print(current, end=" ")
                visited.add(current)
                for i in self.graph[current]:
                    stack.append(i)

    def BFS(self, start):
        queue = deque([start])
        visited = set()
        while queue:
            current = queue.popleft()
            if current not in visited:
                print(current, end=" ")
                visited.add(current)
                for i in self.graph[current]:
                    queue.append(i)