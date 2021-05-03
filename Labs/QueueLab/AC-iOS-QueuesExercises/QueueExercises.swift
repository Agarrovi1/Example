import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var queue = q
    guard !queue.isEmpty else {return nil}
    var currentNodeVal = queue.dequeue()
    var smallest = currentNodeVal
    while !queue.isEmpty {
        currentNodeVal = queue.dequeue()
        guard let unwrapCurrentNodeVal = currentNodeVal, let unwrapSmallest = smallest else {return nil}
        if unwrapSmallest > unwrapCurrentNodeVal {
            smallest = currentNodeVal
        }
    }
    return smallest
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var queue = q
    var sum = Int()
    guard !queue.isEmpty else {return 0}
    while !queue.isEmpty {
        let currentVal = queue.dequeue()
        if let currentVal = currentVal {
            sum += currentVal
        }
    }
    return sum
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    var queue = q
    guard !queue.isEmpty else {return true}
    var sortedQueue = Queue<T>()
    while !queue.isEmpty {
        if let value = smallestElement(in: queue) {
        sortedQueue.enqueue(value)
            _ = queue.dequeue()
        }
    }
    return areEqual(qOne: q, qTwo: sortedQueue)
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    var queue = q
    guard !queue.isEmpty else {return q}
    var reversedStack = Stack<T>()
    var answerQueue = Queue<T>()
    while !queue.isEmpty {
        if let value = queue.dequeue() {
            reversedStack.push(element: value)
        }
    }
    while !reversedStack.isEmpty {
        if let value = reversedStack.pop() {
            answerQueue.enqueue(value)
        }
    }
    return answerQueue
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var queueOne = qOne
    var queueTwo = qTwo
    while !queueOne.isEmpty && !queueTwo.isEmpty {
        let valueOne = queueOne.dequeue()
        let valueTwo = queueTwo.dequeue()
        if let vOne = valueOne, let vTwo = valueTwo {
            if vOne != vTwo {
                return false
            }
        }
    }
    if queueOne.isEmpty && queueTwo.isEmpty {
        return true
    }
    return false
}

