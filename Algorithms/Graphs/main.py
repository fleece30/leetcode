from Graph import Graph
from UndirectedGraph import UndirectedGraph

if __name__ == '__main__':
    g = Graph()
    g.addEdge(0, 1)
    g.addEdge(0, 2)
    g.addEdge(1, 3)
    # g.addEdge(2, 3)
    g.addEdge(2, 4)
    g.addEdge(3, 4)
    g.DFS(0)
    print("\n")
    g.BFS(0)

    print("\n\n")

    ug = UndirectedGraph()
    ug.addEdge(0, 1)
    ug.addEdge(0, 4)
    ug.addEdge(1, 4)
    ug.addEdge(1, 3)
    ug.addEdge(1, 2)
    ug.addEdge(2, 3)
    ug.addEdge(3, 4)
    ug.DFS(0)
    print("\n")
    ug.BFS(0)
