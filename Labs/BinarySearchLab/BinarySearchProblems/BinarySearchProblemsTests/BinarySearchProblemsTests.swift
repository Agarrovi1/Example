//
//  BinarySearchProblemsTests.swift
//  BinarySearchProblemsTests
//
//  Created by Benjamin Stone on 10/1/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import BinarySearchProblems

class BinarySearchProblemsTests: XCTestCase {

    struct MatrixTestCase<T, ExpectedValue: Equatable> {
        let arr: [[T]]
        let target: T
        let expectedValue: ExpectedValue?
    }
        
    struct TestCase<T, ExpectedValue: Equatable> {
        let arr: [T]
        let target: T
        let expectedValue: ExpectedValue?
    }
    
    struct MissingNumberTestCase {
        let arr: [Int]
        let expectedValue: Int
    }

    
    func testBinarySearch() {
        let doubleTestCases: [TestCase<Double, Bool>] = [TestCase(arr: [1,2,3,4,5,6.0], target: 4.0, expectedValue: true),
                                                   TestCase(arr: [0.2, 0.4, 0.45], target: 0.4, expectedValue: true),
                                                   TestCase(arr: [-3, -1, 0, 2], target: 1, expectedValue: false)
        ]
        
        let stringTestCases: [TestCase<String, Bool>] = [TestCase(arr: ["a", "b", "d", "e"], target: "c", expectedValue: false),
                                                   TestCase(arr: ["a", "b", "d", "e"], target: "d", expectedValue: true)
        ]
        
        for testCase in doubleTestCases {
            XCTAssertEqual(binarySearch(arr: testCase.arr, target: testCase.target), testCase.expectedValue)
        }
        
        for testCase in stringTestCases {
            XCTAssertEqual(binarySearch(arr: testCase.arr, target: testCase.target), testCase.expectedValue)
        }
    }
    
    func testRecursiveBinarySearch() {
        let doubleTestCases: [TestCase<Double, Bool>] = [TestCase(arr: [1,2,3,4,5,6.0], target: 4.0, expectedValue: true),
                                                   TestCase(arr: [0.2, 0.4, 0.45], target: 0.4, expectedValue: true),
                                                   TestCase(arr: [-3, -1, 0, 2], target: 1, expectedValue: false)
        ]
        
        let stringTestCases: [TestCase<String, Bool>] = [TestCase(arr: ["a", "b", "d", "e"], target: "c", expectedValue: false),
                                                   TestCase(arr: ["a", "b", "d", "e"], target: "d", expectedValue: true)
        ]
        
        for testCase in doubleTestCases {
            XCTAssertEqual(recursiveBinarySearch(arr: testCase.arr, target: testCase.target), testCase.expectedValue)
        }
        
        for testCase in stringTestCases {
            XCTAssertEqual(recursiveBinarySearch(arr: testCase.arr, target: testCase.target), testCase.expectedValue)
        }
    }
    
    func testMatrixContains() {
        let matrixTestCases: [MatrixTestCase<Int, Bool>] = [MatrixTestCase(arr: [[1,   3,  5,  7],
                                                                           [10, 11, 16, 20],
                                                                           [23, 30, 34, 50]],
                                                                     target: 3, expectedValue: true),
                                                            MatrixTestCase(arr: [[1,   3,  5,  7],
                                                                           [10, 11, 16, 20],
                                                                           [23, 30, 34, 50]],
                                                                     target: 34, expectedValue: true),
                                                            MatrixTestCase(arr: [[1,   3,  5,  7],
                                                                           [10, 11, 16, 20],
                                                                           [23, 30, 34, 50]],
                                                                     target: 31, expectedValue: false),
                                                            MatrixTestCase(arr: [[1, 5, 8, 12],
                                                                           [13, 18, 22, 800]],
                                                                     target: 1, expectedValue: true),
                                                            MatrixTestCase(arr: [[1, 5, 8, 12],
                                                                           [13, 18, 22, 800]],
                                                                     target: 800, expectedValue: true),
                                                            MatrixTestCase(arr: [[1, 5, 8, 12],
                                                                           [13, 18, 22, 800]],
                                                                     target: 18, expectedValue: true),
                                                            MatrixTestCase(arr: [[1, 5, 8, 12],
                                                                           [13, 18, 22, 800]],
                                                                     target: 30, expectedValue: false),
        ]
        for testCase in matrixTestCases {
            XCTAssertEqual(contains(value: testCase.target, in: testCase.arr), testCase.expectedValue)
        }
    }
    
    func testLastOccurrence() {
        let testCases: [TestCase<Int, Int>] = [TestCase(arr: [2,5,5,5,6,6,8,9,9,9], target: 5, expectedValue: 3),
                                               TestCase(arr: [2,5,5,5,6,6,8,9,9,9], target: 4, expectedValue: nil),
                                               TestCase(arr: [1,1,1,2,3,3,4,5,8,8], target: 3, expectedValue: 5),
        ]
        for testCase in testCases {
            XCTAssertEqual(lastOccurrence(of: testCase.target, in: testCase.arr), testCase.expectedValue)
        }
    }
    
    func testSmallestMissingNumber() {
        let testCases: [MissingNumberTestCase] = [MissingNumberTestCase(arr: [0,1,2,6,9,11,15], expectedValue: 3),
                                                  MissingNumberTestCase(arr: [1,2,3,4,6,9,11,15], expectedValue: 0),
                                                  MissingNumberTestCase(arr: [0,1,2,3,4,5,6], expectedValue: 7)
        ]
        for testCase in testCases {
            XCTAssertEqual(smallestMissingNumber(in: testCase.arr), testCase.expectedValue)
        }
    }
}
