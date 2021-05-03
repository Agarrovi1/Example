import UIKit

var str = "Hello, playground"
func eliminateDupl(arr: [Int]) -> [Int] {
    var newArr = [Int]()
    for i in arr {
        if !newArr.contains(i) {
            newArr.append(i)
        }
    }
    return newArr
}


let testArr = [1,2,2,3,4,4,4,5,6]

eliminateDupl(arr: testArr)
