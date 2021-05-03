import Foundation

//

// 1. Find if an element is contained within a sorted array in O(log(n)) time.  Do not use recursion.

func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    var searchRange = 0..<arr.endIndex
//    if searchRange.lowerBound >= searchRange.upperBound {
//        return false
//    }
    while searchRange.lowerBound < searchRange.upperBound {
        let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
        print(searchRange)
        print(arr)
        print(target)
        print("mid index: \(middleIndex)")
        if target == arr[middleIndex] {
            return true
        } else if target < arr[middleIndex] {
            searchRange = searchRange.lowerBound..<middleIndex
        } else {
            searchRange = (middleIndex + 1)..<searchRange.upperBound
        }
    }
    return false
}

// 2. Find if an element is contained within a sorted array in O(log(n)) time.  Use recursion.

func recursiveBinarySearch<T: Comparable>(arr: [T], target: T,range: Range<Int>? = nil) -> Bool {
    let searchRange: Range<Int>
    
    if let range = range {
        searchRange = range
    } else {
        searchRange = (0..<arr.endIndex)
    }
    
    if searchRange.lowerBound >= searchRange.upperBound {
        return false
    }
    let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
    if target == arr[middleIndex] {
        return true
    } else if target < arr[middleIndex] {
        return recursiveBinarySearch(arr: arr, target: target, range: searchRange.lowerBound..<middleIndex)
    } else {
        return recursiveBinarySearch(arr: arr, target: target, range: (middleIndex + 1)..<searchRange.upperBound)
    }
}

// https://www.interviewbit.com/problems/matrix-search/

// 3. Find if a value is contained in a matrix of dimensions m x n. This matrix has the following properties:

// Integers in each row are sorted from left to right.
// The first integer of each row is greater than or equal to the last integer of the previous row.

func contains(value: Int, in arr: [[Int]]) -> Bool {
    var minRowIndex = 0
    var maxRowIndex = arr.count - 1
    while minRowIndex < maxRowIndex {
        let middleRowIndex = (minRowIndex + maxRowIndex) / 2
        if arr[middleRowIndex][0] == value {
            return true
        } else if value < arr[middleRowIndex][0] {
            maxRowIndex = middleRowIndex - 1
        } else if value > arr[middleRowIndex][0] {
            minRowIndex = middleRowIndex + 1
        }
    }
    let targetArr = arr[minRowIndex]
    return binarySearch(arr: targetArr, target: value)
    //return binarySearch func
}



// https://www.techiedelight.com/find-first-or-last-occurrence-of-a-given-number-sorted-array/
// 4. Given a sorted array of integers, find the index of the last occurrence of a given number.  Your solution should work in O(log(n)) time

func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
    var searchRange = 0..<arr.endIndex
    var occuranceIndex: Int? = nil
    while searchRange.lowerBound < searchRange.upperBound {
        let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
        if value == arr[middleIndex] {
            occuranceIndex =  middleIndex
            searchRange = (middleIndex + 1)..<searchRange.upperBound
        } else if value < arr[middleIndex] {
            searchRange = searchRange.lowerBound..<middleIndex
        } else {
            searchRange = (middleIndex + 1)..<searchRange.upperBound
        }
    }
    return occuranceIndex
}

// https://www.techiedelight.com/find-smallest-missing-element-sorted-array/
// 5. Given a sorted array of distinct non-negative integers, find the smallest missing number.  Your solution should work in O(log(n)) time

func smallestMissingNumber(in arr: [Int]) -> Int {
    if arr[0] != 0 {
        return 0
    }
    var searchRange = 0..<arr.endIndex
    var occurance = 0
    var last = 0
    while searchRange.lowerBound < searchRange.upperBound {
        print(searchRange)
        print("occurance: \(occurance)")
        let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
        print("arr[middleIndex]: \(arr[middleIndex])")
        print("mid: \(middleIndex)")
        if middleIndex == arr[middleIndex] {
            searchRange = (middleIndex + 1)..<searchRange.upperBound
        } else if middleIndex < arr[middleIndex] {
            occurance = middleIndex
            last = middleIndex
            searchRange = searchRange.lowerBound..<middleIndex
        }
    }
    if occurance == 0 {
        return last + 1
    }
    print("finish: \(occurance)")
    return occurance
}
