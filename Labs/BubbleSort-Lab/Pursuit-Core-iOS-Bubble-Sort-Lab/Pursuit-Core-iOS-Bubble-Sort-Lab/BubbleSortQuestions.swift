import Foundation

// Question One

// Implement bubble sort that accepts a closure about how to sort elements

func bubbleSort<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var arr = arr
    var madeSwap = false
    repeat {
        madeSwap = false
        for i in 0..<arr.count - 1 {
            if !isSorted(arr[i],arr[i+1]) && arr[i] != arr[i+1] {
                arr.swapAt(i, i+1)
                madeSwap = true
            }
        }
    } while madeSwap
    return arr
}

// Question Two

// Sort an array of Ints without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/

func bubbleSortWithoutMovingNegatives<T: SignedInteger>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var arr = arr
    var madeSwap = false
    repeat {
        madeSwap = false
        //print(arr)
        for i in 0...arr.count - 1 {
            if arr[i] < 0 {
                continue
            }
            for j in i..<arr.count - 1 {
                if arr[j+1] < 0 {
                    continue
                } else if !isSorted(arr[i],arr[j+1]) && arr[i] != arr[j+1] {
                    arr.swapAt(i, j+1)
                    madeSwap = true
                }
                break
            }
            
        }
    } while madeSwap
    return arr
}

// Question Three

// Implement Cocktail sort
// https://www.geeksforgeeks.org/cocktail-sort/

func cocktailSort<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var arr = arr
    var madeSwap = false
    repeat {
        madeSwap = false
        var reversedArr = Array(arr.reversed())
        for i in 0..<arr.count - 1 {
            if !isSorted(arr[i],arr[i+1]) && arr[i] != arr[i+1] {
                arr.swapAt(i, i+1)
                madeSwap = true
                reversedArr = arr.reversed()
            }
        }
        for i in 0..<reversedArr.count - 1 {
            if isSorted(reversedArr[i],reversedArr[i+1]) && reversedArr[i] != reversedArr[i+1] {
                reversedArr.swapAt(i, i+1)
                madeSwap = true
                arr = reversedArr.reversed()
            }
        }
    } while madeSwap
    return arr
}

// Question Four

// Implement bubble sort on a linked list

func bubbleSort<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
    var madeSwap: Bool

    repeat {
        madeSwap = false
        print(list)
        for i in 0..<list.count - 1 {
            let lhs = list.node(at: i)
            let rhs = list.node(at: i+1)
            if !isSorted(lhs.value,rhs.value) && lhs.value != rhs.value {
                list.insert(rhs.value, at: i)
                list.remove(at: i+2)
                madeSwap = true
            }
        }
            
//
//
//        var currentLhs = list.head
//        while let lhs = currentLhs, let rhs = lhs.next {
//            defer {
//                currentLhs = rhs
//            }
//            guard !isSorted(lhs.value,rhs.value) && lhs.value != rhs.value else {
//                break
//            }
//
//
//            madeSwap = true
//        }

        
        
//        while currentrhs != nil || currentrhs?.next != nil {
//            if let lhs = currentlhs, let rhs = currentrhs {
//                if !isSorted(lhs.value,rhs.value) && lhs.value != rhs.value {
//                    let temp = lhs.value
//                    currentlhs?.value = rhs.value
//                    currentrhs?.value = temp
//
//                    madeSwap = true
//                }
//            }
//            currentlhs = currentlhs?.next
//        }
    } while madeSwap
    return list
}
