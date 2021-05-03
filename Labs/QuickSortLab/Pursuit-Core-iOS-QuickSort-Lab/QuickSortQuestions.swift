import Foundation

// Question One

// Implement quick sort that accepts a closure about how to sort elements

func quickSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    
    guard arr.count > 1 else { return arr }
    
    let pivot = arr.last!
    
    var smaller: [T] = []
    var equal: [T] = []
    var bigger: [T] = []
    
    for element in arr {
        if isSorted(element, pivot) {
            smaller.append(element)
        } else if element == pivot {
            equal.append(element)
        } else {
            bigger.append(element)
        }
    }
    
    
    return quickSorted(arr: smaller, by: isSorted) + equal + quickSorted(arr: bigger, by: isSorted)
}

// Question Two

// Sort an array of Ints without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/

func quickSortedWithoutMovingNegatives(arr: [Int], by isSorted: (Int, Int) -> Bool) -> [Int] {
    guard arr.count > 1 else { return arr }

    let pivot = arr.last!
    
    var smaller: [Int] = []
    var equal: [Int] = []
    var bigger: [Int] = []

    if pivot < 0 {
        var copy = arr
        let negative = copy.popLast()!
        return quickSortedWithoutMovingNegatives(arr: copy, by: isSorted) + [negative]
    }
    for element in arr {
        if element < 0 {
            smaller.append(element)
            continue
        }
        if isSorted(element, pivot) {
            smaller.append(element)
        } else if element == pivot {
            equal.append(element)
        } else {
            bigger.append(element)
        }
    }
    print(arr)
    print("small: \(smaller)")
    print("equal: \(equal)")
    print("bigger: \(bigger)")
    return quickSortedWithoutMovingNegatives(arr: smaller, by: isSorted) + equal + quickSortedWithoutMovingNegatives(arr: bigger, by: isSorted)
}

// Question Three

// Implement in place QuickSort.  Do not create any additional arrays (your solution should work in O(1) space).  Check out the link below for a way to shift values without making additional arrays.

// https://en.wikipedia.org/wiki/Quicksort#Lomuto%20partition%20scheme

func quickSortInPlace<T: Comparable>(arr: inout [T], by isSorted: (T, T) -> Bool) {
    guard arr.count > 1 else { return }
    var pivot = arr.last!
    var low = 0
    for index in low..<arr.count - 1 {
        if arr[index] <= pivot {
            arr.swapAt(index, low)
            low += 1
        }
    }
}

// Question Four

// Implement quick sort on a linked list

func quickSorted<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
    return list
}
