//
//  Pursuit_Core_iOS_Bubble_Sort_LabTests.swift
//  Pursuit-Core-iOS-Bubble-Sort-LabTests
//
//  Created by Benjamin Stone on 10/7/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import Pursuit_Core_iOS_Bubble_Sort_Lab

class Pursuit_Core_iOS_Bubble_Sort_LabTests: XCTestCase {

    struct TestCase<T: Collection> {
        let collection: T
        let sortedCollection: T
    }
        
    var qOneAndThreeTestCases: [TestCase<[Int]>] = []
    var qTwoTestCases: [TestCase<[Int]>] = []
    var qFourTestCases: [TestCase<LinkedList<Int>>] = []
    
    override func setUp() {
        qOneAndThreeTestCases = [TestCase(collection: [3,5,2,6,8,4,7],
                              sortedCollection: [2, 3, 4, 5, 6, 7, 8]),
                     TestCase(collection: [9,2,4,8,5,0,42,92,1,133,44,657,134,24,25,462,3],
                              sortedCollection: [0, 1, 2, 3, 4, 5, 8, 9, 24, 25, 42, 44, 92, 133, 134, 462, 657]),
                     TestCase(collection: [2546,246,2,35,32,611,-12,-1,4,-65,-6,52,-2,5,1,-5],
                              sortedCollection: [-65, -12, -6, -5, -2, -1, 1, 2, 4, 5, 32, 35, 52, 246, 611, 2546]),
                     TestCase(collection: [8,7,6,5,4,3,2,1,0,-1,-2,-3,-4,-5],
                              sortedCollection: [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8]),
                     TestCase(collection: [0,0,0,0,0,0,0,0,0,0,0],
                              sortedCollection: [0,0,0,0,0,0,0,0,0,0,0]),
                     TestCase(collection: [1,2,3,2,4,0,0,1],
                              sortedCollection: [0, 0, 1, 1, 2, 2, 3, 4])
        ]
        qTwoTestCases = [TestCase(collection: [3,5,2,6,8,4,7],
                                     sortedCollection: [2, 3, 4, 5, 6, 7, 8]),
                         TestCase(collection: [9,2,4,8,5,0,42,92,1,133,44,657,134,24,25,462,3],
                                     sortedCollection: [0, 1, 2, 3, 4, 5, 8, 9, 24, 25, 42, 44, 92, 133, 134, 462, 657]),
                         TestCase(collection: [2, -6, -3, 8, 4, 1],
                                     sortedCollection: [1, -6, -3, 2, 4, 8]),
                         TestCase(collection: [-2, -6, -3, -8, 4, 1],
                                     sortedCollection: [-2, -6, -3, -8, 1, 4]),
                         TestCase(collection: [0,0,0,0,0,0,0,0,0,0,0],
                                     sortedCollection: [0,0,0,0,0,0,0,0,0,0,0]),
                         TestCase(collection: [1,2,3,2,4,0,0,1],
                                     sortedCollection: [0, 0, 1, 1, 2, 2, 3, 4])
        ]
        qFourTestCases = qOneAndThreeTestCases.map({ (testCase) -> TestCase<LinkedList<Int>> in
            return TestCase<LinkedList<Int>>(collection: LinkedList.init(array: testCase.collection),
                                             sortedCollection: LinkedList.init(array: testCase.sortedCollection))
        })
    }

    override func tearDown() {
        qOneAndThreeTestCases = []
        qTwoTestCases = []
    }
    
    func testBubbleSort() {
        for testCase in qOneAndThreeTestCases {
            let arrayUnderTest = bubbleSort(arr: testCase.collection, by: <)
            XCTAssertEqual(arrayUnderTest, testCase.sortedCollection, "Was expecting \(testCase.sortedCollection), but got \(arrayUnderTest)")
        }
    }
    
    func testBubbleSortWithoutMovingNegatives() {
        for testCase in qTwoTestCases {
            let arrayUnderTest = bubbleSortWithoutMovingNegatives(arr: testCase.collection, by: <)
            XCTAssertEqual(arrayUnderTest, testCase.sortedCollection, "Was expecting \(testCase.sortedCollection), but got \(arrayUnderTest)")
        }
    }
    
    func testCocktailSort() {
        for testCase in qOneAndThreeTestCases {
            let arrayUnderTest = cocktailSort(arr: testCase.collection, by: <)
            XCTAssertEqual(arrayUnderTest,testCase.sortedCollection, "Was expecting \(testCase.sortedCollection), but got \(arrayUnderTest)")
        }
    }
    
    func testBubbleSortLinkedList() {
        for testCase in qFourTestCases {
            let listUnderTest = bubbleSort(list: testCase.collection, by: <)
            XCTAssertEqual(listUnderTest.description, testCase.sortedCollection.description, "Was expecting \(testCase.sortedCollection), but got \(listUnderTest)")
        }
    }
}
