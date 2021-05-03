import Foundation

// Question One
// Implement insertion sort that accepts a closure about how to sort elements
func insertionSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var arr = arr
    for indexOne in 1..<arr.count {
        var indexTwo = indexOne
        while indexTwo > 0 && !isSorted(arr[indexTwo - 1], arr[indexTwo]) {
            arr.swapAt(indexTwo - 1, indexTwo)
            indexTwo -= 1
        }
    }
    return arr
}

// Question Two
// Sort an array of Ints using insertion sort without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/
func insertionSortWithoutMovingNegatives<T: SignedInteger>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var arr = arr
    print(arr)
    for indexOne in 2..<arr.count {
        if arr[indexOne] < 0 {
            continue
        }
        for indexTwo in 0..<indexOne {
            if arr[indexTwo] < 0 {
                continue
            }
            if isSorted(arr[indexOne], arr[indexTwo]) {
                arr.swapAt(indexTwo, indexOne)
            }
        }
    }
    return arr
}

// Question Three
// Implement insertion sort in place
func insertionSort<T: Comparable>(arr: inout [T], by isSorted: (T, T) -> Bool) -> [T] {
    for indexOne in 1..<arr.count {
        var indexTwo = indexOne
        while indexTwo > 0 && !isSorted(arr[indexTwo - 1], arr[indexTwo]) {
            arr.swapAt(indexTwo - 1, indexTwo)
            indexTwo -= 1
        }
    }
    return arr
}

// Question Four
// Implement insertion sort on a linked list
func insertionSorted<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
//    if list.count < 1 {
//        return list
//    }
    print(list)
    for indexOne in 1..<list.count {
        var indexTwo = indexOne
        while indexTwo > 0 && !isSorted(list.node(at: indexTwo - 1).value,list.node(at: indexTwo).value) {
            list.insert(list.node(at: indexTwo).value, at: indexTwo - 1)
            list.remove(at: indexTwo + 1)
            indexTwo -= 1
            print(list)
        }
    }
    return list
}

