import UIKit

var str = "Hello, playground"

func quickSorted<T: Comparable>(arr: [T], by isSorted: (T,T) -> Bool) -> [T] {
    //base case
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
    
    //recursive call
    return quickSorted(arr: smaller, by: isSorted) + equal + quickSorted(arr: bigger, by: isSorted)
}

let randomArr = (1...1000).map { _ in Int.random(in: 1...1000)}
print(randomArr)
let sortedArr = quickSorted(arr: randomArr, by: <)
print(sortedArr)

//low and high are indexes
func lomutoPartitioning(_ arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    let pivot = arr[high]
    
    for j in low..<high {
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

func quickSort(_ arr: inout [Int],low: Int, high: Int) {
    if low < high { //keep going, there is more to sort
        let pivot = lomutoPartitioning(&arr, low: low, high: high)
        
        //sort left of pivot
        quickSort(&arr, low: low, high: pivot - 1)
        
        //sort right of pivot
        quickSort(&arr, low: pivot + 1, high: high)
    }
    
}
