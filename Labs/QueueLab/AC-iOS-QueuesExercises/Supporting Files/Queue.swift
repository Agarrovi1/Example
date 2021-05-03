import Foundation

class Node<Key> {
    let val: Key
    var next: Node?
    init(val: Key) {
        self.val = val
    }
}

struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    mutating func enqueue(_ newElement: T) {
        let newNode = Node(val: newElement)
        guard let tail = tail else {
            self.head = newNode
            self.tail = newNode
            return
        }
        tail.next = newNode
        self.tail = newNode
    }
    mutating func dequeue() -> T? {
        guard let oldHead = head else {
            return nil
        }
        self.head = oldHead.next
        return oldHead.val
    }
    func peek() -> T? {
        return self.head?.val
    }
}
