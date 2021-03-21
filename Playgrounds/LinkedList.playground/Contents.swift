import UIKit

var str = "Hello, playground"
var myInts = [Int8]()
myInts.append(9)
myInts.append(8)
myInts.append(3)
myInts.append(5)
myInts.append(1)
myInts.append(10)

myInts.remove(at: 0)
myInts[0]

//Linked List
//special type T
//could be anything, then when you have one then the rest has to match
class Node<T> {
    let val: T //the value
    var next: Node<T>? //the arrow pointer, the next node needs to be same type as previous type
    init(val: T) {
        self.val = val
    }
}

//can create any type node without having to rewrite class Node to conform to that type

//arrays can only hold one type of thing
let inArr = [Int]()
let doubleArr = [Double]()
let strArr = [String]()

//older way of making array
//Generic way
let intArr2 = Array<Int>()
let doubleArr2 = Array<Double>()
let strArr2 = Array<String>()

let nodeOne = Node(val: 9) //now it is Node<Int>
let nodeTwo = Node(val: 2)
nodeOne.next = nodeTwo // linked together

let strNode = Node(val: "hello") //Node<String>
//nodeTwo.next = strNode, error b/c next node needs to be same type

class LinkedList<T: Equatable> {
    var head: Node<T>?
    //wraps around the nodes in the link
    func printAllNodes() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.val)
            currentNode = currentNode?.next
        }
    }
    func count() -> Int {
        var count = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    func contains(target: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.val == target {
                return true
            } else {
                currentNode = currentNode?.next
            }
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
        var currentNode = head
        if head == nil {
            head = Node(val: newValue)
            return
        }
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(val: newValue)
    }
    func insert(newElement: T, at index: Int) {
        let newNode = Node(val: newElement)
        guard let nodeBefore = getNode(at: index - 1) else {
            if index == 0 {
                newNode.next = head
                head = newNode
            } else {
                append(newValue: newElement)
            }
            return
        }
        //be careful of order
        //assign the of new node first
        //the reassign the pointer of previous node
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
        //* the meat of deleting
        nodeBefore.next = nodeBefore.next?.next
        //*
    }
    init(head: Node<T>?) {
        self.head = head
    }
}

let node1 = Node(val: "one")
let node2 = Node(val: "two")
let node3 = Node(val: "three")
let node4 = Node(val: "four")

node1.next = node2
node2.next = node3
node3.next = node4

let linkedList = LinkedList(head: node1)
linkedList.printAllNodes()
linkedList.insert(newElement: "ten", at: 2)
//print(linkedList.getNode(at: 3)?.val)
linkedList.printAllNodes()
linkedList.insert(newElement: "1000", at: 1000)
linkedList.printAllNodes()
linkedList.contains(target: "on")
