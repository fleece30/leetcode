from Graph import Graph


class UndirectedGraph(Graph):
    def addEdge(self, src, dest):
        self.graph[src].append(dest)
        self.graph[dest].append(src)