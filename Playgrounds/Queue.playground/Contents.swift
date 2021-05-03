import UIKit

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
    mutating func peek() -> Element?
    var isEmpty: Bool {get}
}

struct ArrQueue<Element>: Queue {
    private var arr = [Element]()
    mutating func enqueue(_ newElement: Element) {
        arr.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else {return nil}
        return arr.removeFirst()
    }
    
    func peek() -> Element? {
        return arr.first
    }
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
}

class Node<T> {
    var next: Node<T>?
    let val: T
    init(val: T) {
        self.val = val
    }
}

struct LLQueue<Element>: Queue {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    mutating func enqueue(_ newElement: Element) {
        let newNode = Node(val: newElement)
        guard let oldTail = tail else {
            head = newNode
            tail = newNode
            return
        }
        oldTail.next = newNode
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        guard let oldHead = head else {
            return nil
        }
        head = oldHead.next
        if isEmpty {
            tail = nil
        }
        return oldHead.val
    }
    
    func peek() -> Element? {
        return head?.val
    }
    
    var isEmpty: Bool {
        return head == nil
    }
}

struct Stack<T> {
    
    private var arr = Array<T>()
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
    mutating func push(element: T) {
        arr.append(element)
    }
    
    func peek() -> T? {
        guard arr.count > 0 else {
            return nil
        }
        return arr[arr.count - 1]
    }
    
    func isEmpty() -> Bool {
        return arr.count == 0
    }
}

struct TwoStackQueue<Element>: Queue {
    var enqueueStack = Stack<Element>() //one
    var dequeueStack = Stack<Element>() //two
    mutating func enqueue(_ newElement: Element) {
        //slinky from stack 2 to stack one
        while !dequeueStack.isEmpty() {
            enqueueStack.push(element: dequeueStack.pop()!)
        }
        //push to stack one
        enqueueStack.push(element: newElement)
    }
    
    mutating func dequeue() -> Element? {
        //slinky from stack one to stack two
        while !enqueueStack.isEmpty() {
            dequeueStack.push(element: enqueueStack.pop()!)
        }
        // peek at stack two
        return dequeueStack.pop()
    }
    
    mutating func peek() -> Element? {
        //slinky from stack one to stack two
        while !enqueueStack.isEmpty() {
            dequeueStack.push(element: enqueueStack.pop()!)
        }
        //peek at stack two
        return dequeueStack.peek()
    }
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty() && dequeueStack.isEmpty()
    }
    
}


var myQueue = TwoStackQueue<Int>()
myQueue.isEmpty
myQueue.enqueue(1)
myQueue.peek()
myQueue.enqueue(2)
myQueue.peek()
myQueue.enqueue(3)
myQueue.isEmpty
myQueue.peek()

myQueue.dequeue()
myQueue.dequeue()
myQueue.dequeue()
myQueue.dequeue()

