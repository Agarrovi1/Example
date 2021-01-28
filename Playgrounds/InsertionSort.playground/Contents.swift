import UIKit

var str = "Hello, playground"


//not in place insertion sorting
func insertionSorted<T>(arr: [T],by isSorted: (T,T) -> Bool) -> [T] {
    var sortedArr = [T]()
    for element in arr {
        sortedArr = insert(element, into: sortedArr, by: isSorted)
    }
    return sortedArr
}
func insert<T>(_ newElement: T,into sortedArr:[T],by isSorted: (T,T) -> Bool) -> [T] {
    var sortedArr = sortedArr
    for (index, element) in sortedArr.enumerated() {
        if isSorted(newElement, element) {
            sortedArr.insert(newElement, at: index)
            return sortedArr
        }
    }
    sortedArr.append(newElement)
    return sortedArr
}
let arr = [3,2,9,7,4]
print(insertionSorted(arr: arr, by: <))

//inout KeyWord
func insertionSort<T>(arr: inout [T], by isSorted: (T,T) -> Bool) {
    for indexOne in 1..<arr.count {
        print("IndexOne: \(indexOne)")
        var indexTwo = indexOne
        //comparing to leftmost neighbor
        while indexTwo > 0 && !isSorted(arr[indexTwo - 1], arr[indexTwo]) {
            //exit the loop if we're at the beginning or is where it should be
            arr.swapAt(indexTwo - 1, indexTwo) //swaps references, the values of the variables
            print(arr)
            indexTwo -= 1
            
        }
    }
}

var randomElementArr = (0...10).map({_ in Int.random(in: 0...1_000)})
insertionSort(arr: &randomElementArr, by: <)
