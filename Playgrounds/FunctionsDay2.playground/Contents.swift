import UIKit

//Set Lab question 3
//Input: Array of numbers - suppoesed to have numbers in a sequential, ascending order, but some issues caused it to lose one of those sequestial values, and duplicate one of the other values

//Find a number that occurs twice in an array of numbers
//went through a for-loop to find the missing number - in the input array, check that the value of that number is equal to its index + 1
//this would show us which number is missing (since the conditional in our loop fails at value), and there would be a dictionary to see how many times each number exists (with the number as the key, and the frequency as the value). then there was a loop to go through the dictionary, and see where the value of a key is equal to 2, which would mean there is a duplicate of that of that value

//Output:
//Array with two values - one value is the number that is duplicated in the input array, and the other value is the number that is missing in that input array.

//dictionary can be used to show frequency
let itemFrequency = ["a":1, "b":4, "c":2]
let itemCosts = ["a":3.30, "b":1.23, "c":5.23]

func totalCostOfItems(numberOfItems: [String:Int], costOfItems: [String:Double]) -> Double {
    var totalCost = Double()
    for (itemOuterLoop, frequency) in numberOfItems {
        for (itemInnerLoop, cost) in costOfItems {
            if itemOuterLoop == itemInnerLoop {
                totalCost += (Double(frequency) * cost)
            }
        }
    }
    return totalCost
}

var totalAtRegister = totalCostOfItems(numberOfItems: itemFrequency, costOfItems: itemCosts)

func reduceTotalCostByOne(total: Double) -> Double {
    return total - 1
}

reduceTotalCostByOne(total: totalAtRegister)

var iForgotToPayOneDollarOfMyBill = reduceTotalCostByOne(total: totalAtRegister)

//function that doesn't return anything
func printA() -> Void {
    print("a")
}

func printAVoid() -> Void {
    print("a")
}

func printAEmptyTuple() -> () {
    print("a")
}

printA()

//functions that return must return for all situations

func returnAorNothing(someString: String) -> String? {
    if someString == "a" {
        return "a"
    } else {
        return nil
    }
}

//setting a default value
//default if you dont put in a value for sugar)
func coffeeOrTea(coffee: Bool, amountOfSugar: Int = 1) {
    //choice is ternary where the thing before ? is treated like an if condition if true it equals the first value else if false it is = to the second value
    let choice = coffee ? "coffee" : "tea"
    print("here is your \(choice) with \(amountOfSugar) sugar(s) added")
}

coffeeOrTea(coffee: true)
coffeeOrTea(coffee: true, amountOfSugar: 3)
//sugar == 0 and sugar == nil are two different things


//Q27
func doubleIt(arr: [Int]) -> [Int] {
    var doubledArr: [Int] = []
    for a in arr {
        doubledArr.append((a * 2))
    }
    return doubledArr
}

doubleIt(arr: [1, 2, 3, 4])

func multiplyIt(arr: [Int], n: Int) -> [Int] {
    var multipliedArr: [Int] = []
    for a in arr {
        multipliedArr.append((a * n))
    }
    return multipliedArr
}

multiplyIt(arr: [1, 2, 3, 4], n: 4)

//Q28
func unwrap(arr: [Int?]) -> [Int] {
    var unwrappedArr: [Int] = []
    for a in arr {
        if let bind = a {
            unwrappedArr.append(bind)
        }
    }
    return unwrappedArr
}

unwrap(arr: [nil, 7, 4, nil, 43, 11, nil, 2])

//Q29
func countBools(arr: [Bool]) -> [Bool:Int] {
    var trueCount = 0
    var falseCount = 0
    var DictOfTAndF: [Bool:Int] = [:]
    for a in arr {
        if a == true {
            trueCount += 1
        } else {
            falseCount += 1
        }
    }
    DictOfTAndF[true] = trueCount
    DictOfTAndF[false] = falseCount
    return DictOfTAndF
}

countBools(arr: [true, true, false, true, false, true])

//Q30
func countCharacters(str: String) -> [Character:Int] {
    var charaCount: [Character:Int] = [:]
    for a in str {
        var count = 0
        for b in str {
            if a == b {
                count += 1
            }
        }
        charaCount[a] = count
    }
    return charaCount
}

countCharacters(str: "Hello, World!")

//Q31
func dictToTuples(dict: [Int:String]) -> [(Int, String)] {
    var answerArray: [(Int,String)] = []
    for (a, b) in dict {
        let id = a
        let name = b
        let tuple = (id, name)
        answerArray.append(tuple)
    }
    return answerArray
}

let baseballTeamsById = [1001:"Mets", 1002:"Yankees", 1003:"Rays", 1004:"Marlins"]
dictToTuples(dict: baseballTeamsById)

//Q32
func checkPalindrome(s: String) -> Bool {
    var reverseS = ""
    for a in s {
        reverseS = "\(a)" + reverseS
    }
    if reverseS == s {
        return true
    } else {
        return false
    }
}

checkPalindrome(s: "abba")

//Q33
func checkPangram(str: String) -> Bool {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var alphabetArray = String()
    
    for a in alphabet {
        alphabetArray.append(a)
    }
    
    let alphaSet = Set(alphabetArray)
    
    var sentenceSet: Set<Character> = []
    
    for a in str {
        if a != " " {
            sentenceSet.insert(a)
        }
    }
    
    if alphaSet.isSubset(of: sentenceSet) {
        return true
    } else {
        return false
    }
}

checkPangram(str: "The quick brown fox jumps over the lazy dog")

//Q34
let sample = [1,2,53,77,94,35,24,1,9]
func min(array: [Int]) -> Int {
    let fromHighToLow = array.sorted()
    return fromHighToLow[0]
}

func max(array: [Int]) -> Int {
    let fromHighToLow = array.sorted()
    return fromHighToLow[array.count-1]
}

min(array: sample)
max(array: sample)

//Q35
let sample2 = [1,34,52,53,33,22,1,8,2]
func whatTheyHaveInCommon(arrOne: [Int], arrTwo: [Int]) -> Set<Int> {
    let aOne = Set(arrOne)
    let aTwo = Set(arrTwo)
    return aOne.intersection(aTwo)
}

whatTheyHaveInCommon(arrOne: sample, arrTwo: sample2)

//Q36
func mostFrequentInArrays(arrayOfArrays: [[Int]]) -> [Int] {
    var answerArr: [Int] = []
    var highestCount = 0
    for a in arrayOfArrays {
        var count = 0
        for b in arrayOfArrays {
            if a == b {
                count += 1
            }
        }
        if count > highestCount {
            answerArr = a
            highestCount = count
        }
    }
    return answerArr
}

let sample3 = [[1,2,3],[1,4,5],[1,4,5]]
mostFrequentInArrays(arrayOfArrays: sample3)

//Q37
func rotateLetterByOne(str: String) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let oneLetterOver = "bcdefghijklmnopqrstuvwxyza"
    
    var decoder: [Character:Character] = [:]
    var decoderForUpperCase: [Character:Character] = [:]
    
    var answerStr = ""
    
    let uppercase = alphabet.uppercased()
    let uppercaseOneOver = oneLetterOver.uppercased()
    
    for (indexOuter, a) in alphabet.enumerated() {
        for (indexInner, b) in oneLetterOver.enumerated() {
            if indexOuter == indexInner {
                decoder[a] = b
            }
        }
    }
    
    for (indexOuter, a) in uppercase.enumerated() {
        for (indexInner, b) in uppercaseOneOver.enumerated() {
            if indexOuter == indexInner {
                decoderForUpperCase[a] = b
            }
        }
    }
    
    for a in str {
        if alphabet.contains(a) {
            if let letter = decoder[a] {
            answerStr = answerStr + "\(letter)"
            }
        } else if uppercase.contains(a) {
            if let letterUpper = decoderForUpperCase[a] {
            answerStr = answerStr + "\(letterUpper)"
            }
        } else {
            answerStr = answerStr + "\(a)"
        }
    }
    return answerStr
}

rotateLetterByOne(str: "This is a test string. Anything can be written in here (even Zebras and zebras).")
