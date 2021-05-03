import UIKit

var str = "Hello, playground"

func mergeSorted<T>(arr: [T], by isSorted: (T,T) -> Bool) -> [T] {
    guard arr.count > 1 else {
        return arr
    }
    let leftSide = Array(arr[0..<(arr.count/2)])
    let rightSide = Array(arr[(arr.count / 2)...])
    let sortedLeftSide = mergeSorted(arr: leftSide, by: isSorted)
    let sortedRightSide = mergeSorted(arr: rightSide, by: isSorted)
    let mergedArr = merge(sortedArrOne: sortedLeftSide, sortedArrTwo: sortedRightSide, isSorted: isSorted)
    print("merged arr is \(mergedArr)")
    return mergedArr
}

func merge<T>(sortedArrOne: [T], sortedArrTwo: [T], isSorted: (T,T) -> Bool) -> [T] {
    var arrOneIndex = 0
    var arrTwoIndex = 0
    var mergedSortedArr = [T]()
    while arrOneIndex < sortedArrOne.count && arrTwoIndex < sortedArrTwo.count {
        if isSorted(sortedArrOne[arrOneIndex], sortedArrTwo[arrTwoIndex]) {
            mergedSortedArr.append(sortedArrOne[arrOneIndex])
            arrOneIndex += 1
        } else {
            mergedSortedArr.append(sortedArrTwo[arrTwoIndex])
            arrTwoIndex += 1
        }
    }
    return mergedSortedArr + Array(sortedArrOne[arrOneIndex...]) + Array(sortedArrTwo[arrTwoIndex...])
}
let testArrOne = [3,6,7,10]
let testArrTwo = [4,5,8,11,12]
let mergedArr = merge(sortedArrOne: testArrOne, sortedArrTwo: testArrTwo, isSorted: <)
print(mergedArr)

let testArr = [3,6,10,1,4,9,7,11]
mergeSorted(arr: testArr, by: <)
