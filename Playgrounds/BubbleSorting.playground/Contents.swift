import UIKit

var str = "Hello, playground"
//Bubble sorting, caseyrule.com

func bubbleSort<T:Comparable>(arr:[T],by isSorted: (T,T) -> Bool) -> [T] {
    var arr = arr //variable shadowing
    var madeSwap = false
    repeat {
        madeSwap = false
        print(arr)
        for i in 0..<arr.count - 1 {
            if !isSorted(arr[i],arr[i+1]) && arr[i] != arr[i+1] { //arr[i] > arr[i+1]
                arr.swapAt(i, i+1)
//                let temp = arr[i]
//                arr[i] = arr[i+1]
//                arr[i+1] = temp
                //^same as line 12
                madeSwap = true
            }
        }
    } while madeSwap
    return arr
}


let arr = (1...100).map { _ in Int.random(in: 0...1_000) }
let arr1 = [1,4,2,6,5]

bubbleSort(arr: arr) { (firstElement, secondElement) -> Bool in
    return firstElement < secondElement
}


let reverseSorted = arr.sorted(by: >)
let sortedArr = arr.sorted(by: <)

let bubbleSortStart = Date()
//bubbleSort(arr: sortedArr)
print(Date().timeIntervalSince(bubbleSortStart))
let swiftFancySort = Date()
sortedArr.sorted()
print(Date().timeIntervalSince(swiftFancySort))
