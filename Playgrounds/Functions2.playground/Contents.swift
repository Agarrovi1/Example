import UIKit

var str = "Hello, playground"
//Q9
func repeatPrint(message: Character, count: Int) -> String {
    var totalString = ""
    for _ in 1...count {
        totalString += "\(message)"
    }
    return totalString
}

repeatPrint(message: "+", count: 10)

//Q10
func first (n: Int) -> [Int] {
    var array: [Int] = []
    for a in 1...n {
        array.append(a)
    }
    return array
}

first(n: 3)

//Q11
func fizzCountBuzz(x: Int) {
    for a in 1...x {
        if a % 3 == 0 && a % 5 == 0 {
            print("FizzBuzz")
        } else if a % 3 == 0 {
            print("Fizz")
        } else if a % 5 == 0 {
            print("Buzz")
        } else {
            print(a)
        }
    }
}

fizzCountBuzz(x: 15)

//Q12
func reverse(numbers: [Int]) -> [Int] {
    var reverseArray: [Int] = []
    for a in numbers.indices {
        let b = numbers.count - 1
        reverseArray.append(numbers[b-a])
    }
    return reverseArray
}

reverse(numbers: [1,2,3])

//Q13
func mostFrequentlyRepeatingNum(arrayOfInt: [Int]) -> Int {
    let SetOfInt = Set(arrayOfInt)
    var frequentNum = 0
    var prevCount = 0
    for a in SetOfInt {
        var count = 0
        for b in arrayOfInt {
            if a == b {
                count += 1
            }
        }
        if count > prevCount {
            prevCount = count
            frequentNum = a
        }
    }
    return frequentNum
}

mostFrequentlyRepeatingNum(arrayOfInt: [1,1,1,34,25,66,25,34,24,34,34,65])

//Q14
func sumOfEvenNums(arrayOfInts: [Int]) -> Int {
    var sum = Int()
    for a in arrayOfInts where a % 2 == 0 {
        sum += a
    }
    return sum
}

sumOfEvenNums(arrayOfInts: [1,2,3,4,5,6,7,8])

//Q15
func flipsADictionary(dictionary: [Int:String]) -> [String:Int] {
    var newDictionary: [String:Int] = [:]
    for (a, b) in dictionary {
        newDictionary[b] = a
    }
    return newDictionary
}

flipsADictionary(dictionary: [1: "hi", 5: "bye"])

//Q16
func secondHighestScore(scoresDict: [String:Int]) -> String {
    var arrayOfScores: [Int] = []
    for a in scoresDict.values {
        arrayOfScores.append(a)
    }
    var answer = ""
    
    
    for (a, b) in scoresDict where arrayOfScores.count != 1 {
        let secondIndex = arrayOfScores.count - 2
        let second = arrayOfScores.sorted()[secondIndex]
        if b == second {
            answer = a
        }
    }
    return answer
}
secondHighestScore(scoresDict: ["Person 1": 83, "Person 2": 74, "Person 3": 82])


//Q17
func doesTheArrayContainThisValue(value: Int, array: [Int]) -> Bool {
    let trueOrFalse = array.contains(value)
    return trueOrFalse
}

//Q18
func trueIfEvenFalseIfOdd(num: Int) -> Bool {
    if num % 2 == 0 {
        return true
    } else {
        return false
    }
}

let dieRoll = Int(arc4random_uniform(6) + 1)
trueIfEvenFalseIfOdd(num: dieRoll)

//Q19
let myArray = [3,5,1,3,532,1,4,91,20,30,92,143]

func largestNumInArray(x: [Int]) -> Int {
    let lastIndex = x.count - 1
    let largestNum = x.sorted()[lastIndex]
    return largestNum
}

func statingLargestNumInArray(y: [Int]) -> String {
    let largestNum = largestNumInArray(x: y)
    return "The largest number in this array is \(largestNum)"
}

func statingLargestNumIsEvenOrOdd(z: [Int]) -> String {
    let largestNum = largestNumInArray(x: z)
    let evenOrOdd = trueIfEvenFalseIfOdd(num: largestNum)
    if evenOrOdd == true {
        return "The largest number in my array is even"
    } else {
        return "The largest number in my array is odd"
    }
}

largestNumInArray(x: myArray)
statingLargestNumInArray(y: myArray)
statingLargestNumIsEvenOrOdd(z: myArray)

//Q20
let myString = "Swift is a new programming language for iOS, OS X, watchOS, and tvOS apps that builds on the best of C and Objective-C, without the constraints of C compatibility."

func numOfCharactersInString(s: String) -> Int {
    var count = Int()
    for _ in s {
        count += 1
    }
    return count
}

numOfCharactersInString(s: myString)

//Q21

let testString = "This is a test string for your code"
let targetCharacter: Character = "i"

func numberOfSpecificCharacterInString(c: Character, s:String) -> Int {
    var count = Int()
    for a in s {
        if a == c {
            count += 1
        }
    }
    return count
}

numberOfSpecificCharacterInString(c: targetCharacter, s: testString)

//Q22
let inputString = "This one is a little more complicated"
let targetCharacters: [Character] = ["a","e","i","o","u"]

func howManyCharactersInAStringAllTogether(characters: [Character], s: String) -> Int {
    var count = Int()
    for a in characters {
        for b in s {
            if a == b {
                count += 1
            }
        }
    }
    return count
}

howManyCharactersInAStringAllTogether(characters: targetCharacters, s: inputString)

//Q23
let inputArray2 = [3,1,4,1,3,2,6,1,9]
func uniqueIntInAnArray(array: [Int]) -> Int {
    var arrayInFunc: [Int] = []
    let setOfArray = Set(array)
    for a in setOfArray {
        var count = 0
        for b in array {
            if a == b {
                count += 1
            }
        }
        if count == 1 {
            arrayInFunc.append(a)
        }
    }
    return arrayInFunc.count
}

uniqueIntInAnArray(array: inputArray2)

//Q24
let binaryArray = [1,0,1,1,1,0,1]
let binarySample = [1,0,1,1,0,1]
func convertingBinary(binaryArray: [Int]) -> Int {
    var reverseBinaryString = ""
    var decimalValue = 0
    for a in binaryArray {
        reverseBinaryString = "\(a)" + reverseBinaryString
    }
    for (index, a) in reverseBinaryString.enumerated() where a == "1" {
        var powerOfTwo = 1
        
        if index == 0{
            decimalValue += 1
            continue
        }
        guard index >= 1 else {
            continue
        }
        
        for _ in 1...index {
                powerOfTwo *= 2
        }
        decimalValue += powerOfTwo
    }
    return decimalValue
}

convertingBinary(binaryArray: binaryArray)

//Q25
func timeDifference(firstHour: Int, firstMinute: Int, secondHour: Int, secondMinute: Int) -> Int {
    var differenceOfHoursInMin = (secondHour - firstHour) * 60
    let differenceOfMinutes = secondMinute - firstMinute
    if firstHour > secondHour {
        differenceOfHoursInMin *= -1
    }
    let totalDiff = differenceOfHoursInMin + differenceOfMinutes
    return totalDiff
}

timeDifference(firstHour: 12, firstMinute: 3, secondHour: 13, secondMinute: 10)

//Q26
func filterOdd(arr: [Int]) -> [Int] {
    let setArr = Set(arr)
    var oddNum: [Int] = []
    
    for a in arr {
        if a % 2 != 0 {
            oddNum.append(a)
        }
    }
    
    let setOdd = Set(oddNum)
    let evenSet = setArr.subtracting(setOdd)
    return Array(evenSet)
}

filterOdd(arr: [1, 2, 3, 4, 5, 6, 7, 8])

