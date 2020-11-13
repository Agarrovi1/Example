import UIKit

//class TreeNode<T> {
//    let val: T
//    var left: TreeNode?
//    var right: TreeNode?
//    init(val: T) {
//        self.val = val
//    }
//}
//
//class BinaryTree<T: Comparable> {
//    var root: TreeNode<T>?
//
//    func search(element: T) {
//        recursiveSearch(root, element)
//    }
//    private func recursiveSearch(_ rootNode: TreeNode<T>?, _ element: T) {
//        guard let rootNode = rootNode else {
//            print("cant find \(element)")
//            return
//        }
//        if element > rootNode.val {
//            recursiveSearch(rootNode.right, element)
//        } else if element < rootNode.val {
//            recursiveSearch(rootNode.left, element)
//        } else {
//            print("found \(element)")
//        }
//    }
//
//    func insert(node: TreeNode<T>) {
//        recursiveInsert(root, node)
//    }
//
//    private func recursiveInsert(_ rootNode: TreeNode<T>?, _ node: TreeNode<T>) {
//        guard let rootNode = rootNode else {
//            root = node
//            return
//        }
//        if node.val > rootNode.val {
//            if let right = rootNode.right {
//                recursiveInsert(right, node)
//            } else {
//                rootNode.right = node
//            }
//        } else {
//            if let left = rootNode.left {
//                recursiveInsert(left, node)
//            } else {
//                rootNode.left = node
//            }
//        }
//    }
//}
//
//class NonBinaryTreeNode {
//    let children: [NonBinaryTreeNode]
//    let val: Int
//    init(val: Int, children: [NonBinaryTreeNode]) {
//        self.val = val
//        self.children = children
//    }
//}
//
////Heap
//struct Heap<T> {
//    var elements: [T]
//    let priorityFunction: (T,T) -> Bool
//
//    var isEmpty: Bool {
//        return elements.isEmpty
//    }
//    var count: Int {
//        return elements.count
//    }
//
//    func isRoot(_ index: Int) -> Bool {
//        return index == 0
//    }
//    func leftChildIndex(of index: Int) -> Int {
//        return (2 * index) + 1
//    }
//    func rightChildIndex(of index: Int) -> Int {
//        return (2 * index) + 2
//    }
//    func parentIndex(of index: Int) -> Int {
//        return (index - 1) / 2
//    }
//    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
//        return priorityFunction(elements[firstIndex],elements[secondIndex])
//    }
//    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
//        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
//            return parentIndex
//        }
//        return childIndex
//    }
//    func highestPriorityIndex(for parent: Int) -> Int {
//        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
//    }
//    mutating func swapElements(at firstIndex: Int, with secondIndex: Int) {
//        guard firstIndex != secondIndex else {return}
//        elements.swapAt(firstIndex, secondIndex)
//    }
//    mutating func enque(_ element: T) {
//        elements.append(element)
//        siftUp(elementAtIndex: count - 1)
//    }
//    mutating func siftUp(elementAtIndex: Int) {
//        let parent = parentIndex(of: elementAtIndex)
//        guard !isRoot(elementAtIndex), isHigherPriority(at: elementAtIndex, than: parent) else {
//            return
//        }
//        swapElements(at: elementAtIndex, with: parent)
//        siftUp(elementAtIndex: parent)
//    }
//    mutating func deque() -> T? {
//        guard !isEmpty else {
//            return nil
//        }
//        swapElements(at: 0, with: count - 1)
//        let element = elements.removeLast()
//        if !isEmpty {
//            siftDown(elementAtIndex: 0)
//        }
//        return element
//    }
//    mutating func siftDown(elementAtIndex: Int) {
//        let childIndex = highestPriorityIndex(for: elementAtIndex)
//        if elementAtIndex == childIndex {
//            return
//        }
//        swapElements(at: elementAtIndex, with: childIndex)
//        siftDown(elementAtIndex: childIndex)
//    }
//    init(elements: [T] = [], priorityFunction: @escaping (T,T) -> Bool) {
//        self.elements = elements
//        self.priorityFunction = priorityFunction
//        buildHeap()
//    }
//    mutating func buildHeap() {
//        for index in (0..<count / 2).reversed() {
//            siftDown(elementAtIndex: index)
//        }
//    }
//}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
func inOrderTraversal(root: TreeNode?, result: inout [Int]) {
    if root == nil {return}
    inOrderTraversal(root: root?.left, result: &result)
    result.append(root!.val)
    inOrderTraversal(root: root?.right, result: &result)
}
func increasingBST(_ root: TreeNode?) -> TreeNode? {
    var inorder: [Int] = []
    inOrderTraversal(root: root, result: &inorder)
    let root: TreeNode = TreeNode(0)
    var current: TreeNode = root
    for element in inorder {
        current.right = TreeNode(element)
        current = current.right!
    }
    return root.right
}

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil { return root }
    let left = invertTree(root?.left)
    let right = invertTree(root?.right)
    root?.left = right
    root?.right = left
    return root
}

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    var minLevel = 0
    var queue = [root]
    while !queue.isEmpty {
        minLevel += 1
        for _ in 0..<queue.count {
            let current = queue.removeFirst()
            if current.left == nil && current.right == nil {
                return minLevel
            }
            if let right = current.right {
                queue.append(right)
            }
            if let left = current.left {
                queue.append(left)
            }
        }
    }
    return minLevel
}
func distributeCoins(_ root: TreeNode?) -> Int {
  var moves = 0
  traverseCount(root, moves: &moves)
  return moves
}
func traverseCount(_ node: TreeNode?, moves: inout Int) -> Int {
  guard let node = node else { return 0 }
  let leftCost = traverseCount(node.left, moves: &moves)
  let rightCost = traverseCount(node.right, moves: &moves)
  moves += abs(leftCost) + abs(rightCost)
  return node.val - 1 + leftCost + rightCost
}

//
//func findLeftMostNode(_ root: TreeNode) -> TreeNode? {
//    if let left = root.left {
//        return findLeftMostNode(left)
//    } else {
//        return nil
//    }
//}
//func inOrderTraversal(node: TreeNode?, values: [Int]) -> [Int] {
//    guard let node = node else { return [] }
//    inOrderTraversal(node: node.left,values: values)
//    var moreValues = values
//    moreValues.append(node.val)
//    inOrderTraversal(node: node.right,values: moreValues)
//
//    return moreValues
//}
//func increasingBST(_ root: TreeNode?) -> TreeNode? {
//    guard let root = root else {
//        return nil
//    }
//    var inOrderValues = inOrderTraversal(node: root, values: [])
//
//    var currentNode = TreeNode(inOrderValues[0])
//    let _ = inOrderValues.remove(at: 0)
//    for value in inOrderValues {
//        currentNode.right = TreeNode(value)
//        currentNode = currentNode.right!
//    }
//    return root
//}


