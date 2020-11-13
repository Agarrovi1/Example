import UIKit

var str = "Hello, playground"

//q18
var tripleSumArr = [-20,-14, -8,-5,-3,-2,1,2,3,4,9,15,20,30]
var tripleSum10: [[Int]] = []
for a in tripleSumArr {
    for b in tripleSumArr {
        for c in tripleSumArr {
            if (a + b + c) == 10 {
                tripleSum10.append([a,b,c])
            }
        }
    }
}
print(tripleSum10)

//19
var sampleQ19 = ["apes", "abba", "apple"]
var numberOfA = 0
var arrayForA: [Int] = []
var placeHolder = 0
for a in sampleQ19.indices {
    for b in sampleQ19[a] {
        if "\(b)" == "a" {
            numberOfA += 1
            continue
        }
    }
    arrayForA.append(numberOfA)
    numberOfA = 0
}
for a in arrayForA {
    if a >= placeHolder {
        placeHolder = a
    }
}
for a in arrayForA.indices {
    if placeHolder == arrayForA[a] {
        print(sampleQ19[a])
    }
}
//print(arrayForA)

//q20
var arrayOfArrays = [[2,4,1],[3,0],[9,3]]
var sum = 0
var blankArray: [Int] = []
for a in arrayOfArrays.indices {
    for b in arrayOfArrays[a] {
        sum += b
    }
    blankArray.append(sum)
    sum = 0
}
placeHolder = 0
for a in blankArray {
    if a >= placeHolder {
        placeHolder = a
    }
}
for a in arrayOfArrays.indices {
    if placeHolder == blankArray[a] {
        print(arrayOfArrays[a])
    }
}
print(blankArray)

//q21
var arrayOfTuples = [(4,2), (-3,-3), (1,1), (3,9)]
var ArrayForQ21: [(Int,Int)] = []
for a in arrayOfTuples.indices {
    if arrayOfTuples[a].0 == arrayOfTuples[a].1 {
        ArrayForQ21.append((arrayOfTuples[a].0,arrayOfTuples[a].1))
    }
}
print(ArrayForQ21)

//q22
var boolArray = [true, false, true, true]
var allAreTrue = true
if boolArray.contains(false) {
    allAreTrue = false
} else {
    allAreTrue = true
}
print(allAreTrue)

//q23
var rangeArray = [0..<3 , 2..<10, -4..<6, 13..<14]
var numbersInRange: [Int] = []
for a in rangeArray.indices {
    for b in rangeArray[a] {
        if !numbersInRange.contains(b) {
            numbersInRange.append(b)
        }
    }
}
print(numbersInRange.sorted())

//q24
let arr: [Character] = ["a", "p","P","l","E"," ","S","a","u","C","e"]
var blank = ""
for (index, a) in arr.enumerated() {
    if a.isUppercase {
        continue
    }
    if a.isWhitespace {
        continue
    }
    if index % 2 != 0 {
        blank += "\(a.uppercased())"
    } else {
        blank += "\(a)"
    }
}
print(blank)

//q25
//var myMatrix = [[10, 14, 12], [91, 1, 9], [31, 3, 21]]
//for a in 0...2 {
//    print(myMatrix[a])
//}

//q26
var myMatrix = [[10, 14, 12], [91, 1, 9], [31, 3, 21]]
var sum1Diagonal = 0
var sum2Diagonal = 0
for a in 0...2 {
    sum1Diagonal += myMatrix[a][a]
}
for a in 0...2 {
    sum2Diagonal += myMatrix[a][2-a]
}
print(sum1Diagonal + sum2Diagonal)

//q27
var matrixToRotate = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
var rotatedMatrix: [[Int]] = []
var array1: [Int] = []
var array2: [Int] = []
var array3: [Int] = []

for a in 0...2 {
    array1.append(matrixToRotate[2-a][0])
}

for a in 0...2 {
    array2.append(matrixToRotate[2-a][1])
}

for a in 0...2 {
    array3.append(matrixToRotate[2-a][2])
}

rotatedMatrix.append(array1)
rotatedMatrix.append(array2)
rotatedMatrix.append(array3)
for a in 0...2 {
    print(rotatedMatrix[a])
}
