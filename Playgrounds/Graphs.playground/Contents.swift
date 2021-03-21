import UIKit
//https://github.com/joinpursuit/Pursuit-Core-DSA/tree/master/lessons/graphs/ios

struct Vertex<T:Hashable>: Hashable, CustomStringConvertible {
    
    var data: T
    var description: String {
        return "\(data)"
    }
    
}

struct Edge<T:Hashable>: Hashable {
    var source: Vertex<T>
    var destination: Vertex<T>
    let weight: Double?
    
}

enum EdgeType {
    case directed, undirected
}

protocol Graph {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source:Vertex<Element>) -> [Edge<Element>]?
}


class AdjacencyList<T: Hashable>: Graph {
    typealias Element = T
    
    var adjancencyDictionary: [Vertex<T> : [Edge<T>]] = [:]
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        if adjancencyDictionary[vertex] == nil {
            adjancencyDictionary[vertex] = []
        }
        
        return vertex
    }
    
    
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjancencyDictionary[source]?.append(edge)
    }
    
    func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    
    func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source,destination), weight: weight)
        }
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjancencyDictionary[source] else { return nil }
        
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
    
    
    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjancencyDictionary[source]
    }
    
    public var description: CustomStringConvertible {
         var result = " "
         for (vertex, edges) in adjancencyDictionary {
           var edgeString = ""
           for (index, edge) in edges.enumerated() {
             if index != edges.count - 1 {
               edgeString.append("\(edge.destination), ")
             } else {
               edgeString.append("\(edge.destination)")
             }
           }
           result.append("\(vertex) ---> [ \(edgeString) ] \n ")
         }
         return result
       }
    
}

class Stack<T> {
    var array: [T] = []
    func push(_ element: T) {
        array.append(element)
    }
    func pop() -> T? {
        array.popLast()
    }
    func peek() -> T? {
        array.last
    }
}


func depthFirstSearch(from start: Vertex<String>, to end: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
    
    //keep track of what we have seen to prevent loops
  var visited = Set<Vertex<String>>()
    //store potential paths
  var stack = Stack<Vertex<String>>()
  
    stack.push(start)
    visited.insert(start)
    
    //loop to check entire graph through stack
    outer: while let vertex = stack.peek(), vertex != end {

    //check for neighbors otherwise pop from stack
      guard let neighbors = graph.edges(from: vertex), neighbors.count > 0 else {
        print("backtrack from \(vertex)")
        stack.pop()
        continue
      }
      
        //go through  edges to add potential paths
      for edge in neighbors {
        if !visited.contains(edge.destination) {
          visited.insert(edge.destination)
          stack.push(edge.destination)
          continue outer
        }
      }
      
     //backtrack from vertex
      stack.pop()
    }

  return stack //will have path
}

class Queue<T> {
    var array: [T] = []
    func enqueue(_ element: T) {
        array.append(element)
    }
    func dequeue() -> T? {
        if !array.isEmpty {
            return array.removeFirst()
        } else {
            return nil
        }
    }
}


enum Visit<Element: Hashable> {
  case source
  case edge(Edge<Element>)
}


 func breadthFirstSearch<Element>(from source: Vertex<Element>, to destination: Vertex<Element>, graph: AdjacencyList<Element>) -> [Edge<Element>]? {
    
 var queue = Queue<Vertex<Element>>()
    queue.enqueue(source)
    var visits : [Vertex<Element> : Visit<Element>] = [source: .source]

    while let visitedVertex = queue.dequeue() {
   
      if visitedVertex == destination {
       var vertex = destination
        var route: [Edge<Element>] = []

        while let visit = visits[vertex],
          case .edge(let edge) = visit {

          route = [edge] + route
          vertex = edge.source

        }
        return route
      }
        let neighbourEdges = graph.edges(from: visitedVertex) ?? []
      for edge in neighbourEdges {
        if visits[edge.destination] == nil {
          queue.enqueue(edge.destination)
          visits[edge.destination] = .edge(edge)
        }
      }
    }
    return nil
}




func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var queue = Queue<(edges:[Int],path: [Int])>()
    var paths = [[Int]]()
    queue.enqueue((graph[0], [0]))
    while let tuple = queue.dequeue() {
        print(tuple)
        if tuple.edges == [] {
            paths += [tuple.path]
        }
        for node in tuple.edges {
            print(node)
            queue.enqueue((graph[node],tuple.path + [node]))
        }
        
    }
    print(paths)
    return paths
}

allPathsSourceTarget([[1,2], [3], [3], []])

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
    var currentEdges = edges.filter { (array) -> Bool in
            array[0] == n
    }
    var queue = Queue<Int>()
    var adjacentDict: [Int:[Int]] = [:]
    for nCity in 0...n - 1 {
        queue.enqueue(nCity)
        
    }
    
    
    return 0
}

