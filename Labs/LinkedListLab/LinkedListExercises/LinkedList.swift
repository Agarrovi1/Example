//
//  LinkedList.swift
//  LinkedListExercises
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

public class Node<T: Equatable>: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.key == rhs.key
    }
    
    var key: T
    var next: Node<T>?
    init(key: T) {
        self.key = key
    }
}

public class LinkedList<T: Comparable> {
    
    var head: Node<T>?
    func printAllKeys() {
        var currentNode = head
        while currentNode != nil {
            print(currentNode!.key)
            currentNode = currentNode?.next
        }
    }

    var count: Int {
        var counter = 0
        var currentNode = head
        if head == nil {
            return 0
        }
        while currentNode != nil {
            currentNode = currentNode?.next
            counter += 1
        }
        return counter
    }
    
    func append(element newKey: T) {
        var currentNode = head
        if currentNode == nil {
            head = Node(key: newKey)
            return
        }
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        currentNode?.next = Node(key: newKey)
    }
    
    func getNode(at index: Int) -> Node<T>? {
        guard index >= 0 else {return nil}
        guard index <= count - 1 else {return nil}
        var counter = 0
        var currentNode = head
        while counter < index {
            currentNode = currentNode?.next
            counter += 1
        }
        return currentNode
    }
    
    func contains(element targetKey: T) -> Bool {
        var currentNode = head
        while currentNode != nil {
            if currentNode?.key == targetKey {
                return true
            } else {
                currentNode = currentNode?.next
            }
        }
        return false
    }
    
    func equals(otherList: LinkedList<T>) -> Bool {
        var currentNodeSelf = head
        var currentNodeOther = otherList.head
        if count == 0, otherList.count == 0 {
            return true
        }
        while currentNodeSelf != nil {
            if currentNodeSelf == currentNodeOther {
                currentNodeSelf = currentNodeSelf?.next
                currentNodeOther = currentNodeOther?.next
            } else {
                return false
            }
        }
        return true
    }
    
    func toArr() -> [T] {
        if count == 0 {
            return Array<T>()
        }
        var currentNode = head
        var arr = Array<T>()
        while currentNode != nil {
            guard let value = currentNode?.key else {return Array<T>()}
            arr.append(value)
            currentNode = currentNode?.next
        }
        return arr
    }
    
    func reversed() -> LinkedList<T> {
        if count == 0 {return LinkedList<T>()}
        if count == 1 {return self}
        let newLink = LinkedList<T>()
        var currentIndex = count
        while currentIndex > 0 {
            guard let value = getNode(at: currentIndex)?.key else {return LinkedList<T>()}
            newLink.append(element: value)
            currentIndex -= 1
        }
        return newLink
        
    }
    
    func removeAll() {
        head = nil
    }
    
    func insert(nodeWithKey: T, at index: Int) {
        let newNode = Node(key: nodeWithKey)
        guard let nodeBefore = getNode(at: index - 1) else {
            if index == 0 {
                newNode.next = head
                head = newNode
            } else {
                append(element: nodeWithKey)
            }
            return
        }
        newNode.next = nodeBefore.next
        nodeBefore.next = newNode
    }
    
    //Challenge Questions
    func removeDuplicatesFromSortedList() {
        var arr = toArr()
        arr.sort(by: {$0 < $1})
        let newList = LinkedList<T>()
        for a in arr {
            if !newList.contains(element: a) {
                newList.append(element: a)
            } else {
                continue
            }
        }
        removeAll()
        var currentNode = newList.head
        while currentNode != nil {
            guard let value = currentNode?.key else {return}
            append(element: value)
            currentNode = currentNode?.next
        }
    }
    
    static func mergeSortedLists(listOne: LinkedList<T>, listTwo: LinkedList<T>) -> LinkedList<T> {
        let newList = LinkedList<T>()
        let arrOne = listOne.toArr()
        let arrTwo = listTwo.toArr()
        var bothArr = arrOne + arrTwo
        bothArr.sort(by: {$0 < $1})
        for a in bothArr {
            newList.append(element: a)
        }
        return newList
    }
    
    


}

