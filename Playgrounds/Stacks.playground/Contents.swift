import UIKit

var str = "Hello, playground"
//Element == T (generic type)

protocol Stack {
    associatedtype Element
    mutating func push(_ newElement: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
    var isEmpty: Bool {get}
    
}
struct ArrStack<Element>: Stack {
    mutating func push(_ newElement: Element) {
        arr.append(newElement)
    }
    
    mutating func pop() -> Element? {
        return arr.popLast()
    }
    
    func peek() -> Element? {
        return arr.last
    }
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
    private var arr: [Element] = []
    
}

var myStack = ArrStack<Int>()
myStack.push(4)
myStack.push(5)
myStack.push(94)

myStack.peek()

myStack.pop()
myStack.pop()
myStack.pop()
myStack.isEmpty

//Linked List
class Node<T> {
    let val: T
    var next: Node<T>?
    init(val: T) {
        self.val = val
    }
}


class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    var count: Int {
        var count = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    func printAllNodes() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.val)
            currentNode = currentNode?.next
        }
    }
    
    func contains(target: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.val == target { return true }
            currentNode = currentNode?.next
        }
        return false
    }
    
    func getNode(at index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        var counter = 0
        var currentNode = head
        while counter < index {
            currentNode = currentNode?.next
            counter += 1
        }
        return currentNode
    }
    
    func append(newValue: T) {
        if head == nil {
            head = Node(val: newValue)
            return
        }
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(val: newValue)
    }
    
    func insert(newValue: T, at index: Int) {
        let newNode = Node(val: newValue)
        guard let nodeBefore = getNode(at: index - 1) else {
            if index == 0 {
                newNode.next = head
                head = newNode
            } else {
                append(newValue: newValue)
            }
            return
        }
        newNode.next = nodeBefore.next
        nodeBefore.next = newNode
    }
    
    func delete(at index: Int) {
        guard let nodeBefore = getNode(at: index - 1) else {
            if index == 0 {
                head = head?.next
            }
            return
        }
        nodeBefore.next = nodeBefore.next?.next
    }
    
    init(head: Node<T>?) {
        self.head = head
    }
    private var arr: Array<T> = []
}

struct LinkedListStack<Element: Equatable>: Stack {
func push(_ newElement: Element) {
    linkedList.append(newValue: newElement)
}

func pop() -> Element? {
    let tailNodeVal = linkedList.getNode(at: linkedList.count - 1)?.val
    linkedList.delete(at: linkedList.count - 1)
    return tailNodeVal
}

func peek() -> Element? {
    let linkedListCount = linkedList.count
    let tailNode = linkedList.getNode(at: linkedListCount - 1)
    return tailNode?.val
}

    var isEmpty: Bool {
        return linkedList.count == 0
    }
    private var linkedList = LinkedList<Element>(head: nil)
}

var myStack1 = LinkedListStack<Int>()
myStack1.push(4)
myStack1.push(5)
myStack1.push(94)

myStack1.peek()

myStack1.pop()
myStack1.pop()
myStack1.pop()
myStack1.isEmpty
