import XCTest
@testable import DictionaryLab

class DictionaryLabTests: XCTestCase {

    func testMostFrequentlyOccurringChar() {
        XCTAssertEqual(mostFrequentlyOccurringChar(in: "abcabcb"), "b")
        XCTAssertEqual(mostFrequentlyOccurringChar(in: "h e l l o"), " ")
        XCTAssertEqual(mostFrequentlyOccurringChar(in: "🙂😀😀😀🙂"), "😀")
    }
    
    func testPairSum() {
        XCTAssertEqual(pairSum(arr: [2, 7, 11, 15], target: 9).0, 0)
        XCTAssertEqual(pairSum(arr: [2, 7, 11, 15], target: 9).1, 1)
        
        XCTAssertEqual(pairSum(arr: [1, 4, 45, 6, 10, -8], target: 16).0, 3)
        XCTAssertEqual(pairSum(arr: [1, 4, 45, 6, 10, -8], target: 16).1, 4)
        
        XCTAssertEqual(pairSum(arr: [8,7,2,5,0,1], target: 10).0, 0)
        XCTAssertEqual(pairSum(arr: [8,7,2,5,0,1], target: 10).1, 2)
    }
    
    func testSecondMostFrequentlyOccurringChar() {
        XCTAssertEqual(secondMostFrequentlyOccurringChar(in: "🙂😀😀😀🙂"), "🙂")
        XCTAssertEqual(secondMostFrequentlyOccurringChar(in: "h e l l o"), "l")
        XCTAssertEqual(secondMostFrequentlyOccurringChar(in: "loose balloons"), "l")
    }
    
    func testRansomNote() {
        XCTAssertFalse(canConstruct(note: "a", from: "b"))
        XCTAssertFalse(canConstruct(note: "aa", from: "ab"))
        XCTAssertTrue(canConstruct(note: "aa", from: "aab"))
    }
    
    func testContainsDuplicates() {
        XCTAssertTrue(containsDuplicates(arr: [1,5,3,6,3,6,3,2]))
        XCTAssertTrue(containsDuplicates(arr: [12,3,4,5,6,3]))
        XCTAssertTrue(containsDuplicates(arr: [0,1,4,2,45,0]))
        XCTAssertFalse(containsDuplicates(arr: [3,62,47,328]))
        XCTAssertFalse(containsDuplicates(arr: []))
        XCTAssertFalse(containsDuplicates(arr: [4]))
    }
    
    func testUniqueValues() {
        XCTAssertEqual(uniqueValues(in: ["hey", "there", "hey", "there", "hay"]), ["hay"])
        XCTAssertEqual(uniqueValues(in: ["Eveything", "is", "unique", "here"]), ["Eveything", "is", "unique", "here"])
        XCTAssertEqual(uniqueValues(in: ["a", "aa", "ba", "aa", "bb"]), ["a", "ba", "bb"])
    }
    
    func testSortByFrequency() {
        XCTAssertEqual(sortByFrequency(arr: [1,6,3,1,6,1]), [1,1,1,6,6,3])
        XCTAssertEqual(sortByFrequency(arr: [5,4,5,4,5,10]), [5,5,5,4,4,10])
        XCTAssertEqual(sortByFrequency(arr: [9,3,3,3,4,9]), [3,3,3,9,9,4])
    }
}
