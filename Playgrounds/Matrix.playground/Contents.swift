import UIKit

var str = "Hello, playground"


func rotateMatrix(matrix: [[Int]]) -> [[Int]] {
    var rotMatrix = matrix
    
    for (arrIndex, arr) in matrix.enumerated() {
        for (numIndex, num) in arr.enumerated() {
            let A = arrIndex
            let B = numIndex
            let newA = B
            let newB = (arr.count - 1) - A
            
            rotMatrix[newA][newB] = num
        }
    }
    return rotMatrix

}

let matrix = [[1,2,3],
[4,5,6],
[7,8,9]]

print(rotateMatrix(matrix: matrix))
