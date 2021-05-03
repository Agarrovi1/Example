import XCTest
@testable import AC_iOS_QueuesExercises

class AC_iOS_QueuesExercisesTests: XCTestCase {

    var myQueue = Queue<Int>()
    var otherQueue = Queue<Int>()
    var emptyQueue = Queue<Int>()
    
    override func setUp() {
        super.setUp()
        var myQ = Queue<Int>()
        myQ.enqueue(39)
        myQ.enqueue(10)
        myQ.enqueue(7)
                
        myQueue.enqueue(5)
        myQueue.enqueue(10)
        myQueue.enqueue(13)
        myQueue.enqueue(17)
        
        otherQueue.enqueue(8)
        otherQueue.enqueue(11)
        otherQueue.enqueue(9)
        
    }
    
    override func tearDown() {
        myQueue = Queue<Int>()
        otherQueue = Queue<Int>()
        emptyQueue = Queue<Int>()

        super.tearDown()
    }
    
    func testSum() {
        XCTAssertTrue(sum(of: myQueue) == 45)
        XCTAssertTrue(sum(of: otherQueue) == 28)
    }
    
    func testSmallest() {
        XCTAssertTrue(smallestElement(in: myQueue) == 5)
        XCTAssertTrue(smallestElement(in: otherQueue) == 8)
        XCTAssertNil(smallestElement(in: emptyQueue))
    }
    
    func testIsSorted() {
        XCTAssertTrue(isSorted(q: myQueue))
        XCTAssertFalse(isSorted(q: otherQueue))
    }
    
    func testReverse() {
        var reversedMyQueue = Queue<Int>()
        reversedMyQueue.enqueue(17)
        reversedMyQueue.enqueue(13)
        reversedMyQueue.enqueue(10)
        reversedMyQueue.enqueue(5)
        var userReversed = reversed(q: myQueue)
        
        while !(reversedMyQueue.isEmpty) && !(userReversed.isEmpty) {
            XCTAssertTrue(reversedMyQueue.dequeue() == userReversed.dequeue())
        }
        XCTAssertNil(reversed(q: emptyQueue).peek())
    }
    
    func testEquals() {
        var myQueueCopy = Queue<Int>()
        myQueueCopy.enqueue(5)
        myQueueCopy.enqueue(10)
        myQueueCopy.enqueue(13)
        myQueueCopy.enqueue(17)
        
        var otherQueueCopy = Queue<Int>()
        otherQueueCopy.enqueue(8)
        otherQueueCopy.enqueue(11)
        otherQueueCopy.enqueue(9)
        
        XCTAssertTrue(areEqual(qOne: myQueue, qTwo: myQueueCopy))
        XCTAssertTrue(areEqual(qOne: otherQueue, qTwo: otherQueueCopy))
        XCTAssertFalse(areEqual(qOne: myQueue, qTwo: otherQueue))
        XCTAssertFalse(areEqual(qOne: otherQueueCopy, qTwo: emptyQueue))
    }    
}
