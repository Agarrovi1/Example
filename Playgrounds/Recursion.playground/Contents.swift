import UIKit

var str = "Hello, playground"

//Recursion - a function that calls itself
//UInt - unsigned doesnt take in a negative sign
func countDownToZero(from currentNum: Int) {
    //BaseCase -Begin- condition to stop the function
    if currentNum <= 0 {
        return
    }
    //BaseCase -End-
    print(currentNum)
    countDownToZero(from: currentNum - 1)
}
//but this can still go on forever if given a negative number

func countUp(to target: Int, startingAt currentNum: Int) {
    //Base Case
    if target < currentNum {
        return
    }
    
    print(currentNum)
    
    //Recursive Call
    countUp(to: target, startingAt: currentNum + 1)
}

//countUp(to: 5, startingAt: 1)

func iterativeFactorial(n:Int) -> Int {
    var product = 1
    for number in 1...n {
        product *= number
    }
    return product
    //return (1...n).reduce(1, *)
    //O(n)
}
iterativeFactorial(n: 5)

func recursiveFactorial(n: Int) -> Int {
    //Base Case
    if n == 0 { return 1 }
    
    //Recursive Call
    print(n)
    return n * recursiveFactorial(n: n - 1)
    
    //returning something we dont know yet
}
//recursiveFactorial(n: 5)

//5! = 5 * 4 * 3 * 2 * 1
//5! = 5 * 4!
//defined factorial
//factorial(5) = 5 * factorial(4)
//factorial(n) = n * factorial(n-1) &&&&&& factorial(0) = 1

//Fibonacci Sequence - is made by adding the two previous numbers together
//1, 1, 2, 3, 5, 8, 13, 21, 34 ...

func iterativeFib(n:Int) -> Int {
    if n < 2 { return 1 }
    var numOne = 1
    var numTwo = 1
    var currentNum = Int()
    for _ in 0...(n-2) {
        currentNum = numOne + numTwo
        numOne = numTwo
        numTwo = currentNum
    }
    return currentNum
}

//iterativeFib(n: 4)
//iterativeFib(n: 8)
var fibNums: [Int:Int] = [:]
func recursiveFib(n:Int) -> Int {
    print("I am finding fib number: \(n)")
    
    //Base Case
    if n < 2 { return 1 }
    if let value = fibNums[n] {
        return value
    }
    //Recursive Call
    let numOne = recursiveFib(n: n - 1)
    fibNums[n-1] = numOne
    let numTwo = recursiveFib(n: n - 2)
    fibNums[n-2] = numTwo
    return recursiveFib(n: n - 1) + recursiveFib(n: n - 2)
}
//recursiveFib(n: 6)

//Lab
//Q1
func sumOfAllFromOne(to num: Int) -> Int {
    if num <= 1 {
        return 1
    }
   return num + sumOfAllFromOne(to: num - 1)
}
sumOfAllFromOne(to: 6)

//Q2
func multArr(_ arr: [Int]) -> Int {
    var newArr = arr
    if newArr.count == 1 {
        return newArr[0]
    }
    guard let lastNum = newArr.popLast() else {
        //could use .removeFirst (not optional) instead of .poplast
        return 1
    }
    return lastNum * multArr(newArr)
}
multArr([5, 5, 1, 2])

//Q3
func concatArr(_ arr: [String]) -> String {
    var newArr = arr
    if newArr.count == 1 {
        return newArr[0]
    }
    return newArr.removeFirst() + " " + concatArr(newArr)
}
concatArr(["is", "it", "tomorrow"])

//Q4
func sumEvens(_ arr:[Int]) -> Int {
    var evenArr = arr.filter({$0 % 2 == 0})
    if evenArr.count == 1 {
        return evenArr[0]
    }
    return evenArr.removeFirst() + sumEvens(evenArr)
}
sumEvens([2, 3, 5, 6])
sumEvens([10, 5, 1, 2, 12])

//Q5
func range(_ numOne:Int, _ numTwo:Int) -> [Int] {
    if numOne >= numTwo {
        return [numOne]
    }
    return [numOne] + range(numOne + 1, numTwo)
}
range(2,10)

//Q6
func tripleStep(_ n:Int) -> Int {
    if n == 0 {
        return 1
    }
    if n < 0 {
        return 0
    }
    return tripleStep(n-1) + tripleStep(n-2) + tripleStep(n-3)
}
tripleStep(10)

//Q7

func coinCombos(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    if n < 0 {
        return 1
    }
    if n < 5 {
        return 1
    }
    if n < 10 {
        return 2
    }
    if n < 25 {
       return 4
    }
    return 1 + coinCombos(n - 5) + coinCombos(n - 10) - coinCombos(n - 25)
}
coinCombos(60)

//Ben's answer to q7
var combos: [[Int]] = []

func populateCombos(_ startingAmount: Int, coins: [Int] = []) {
    print(coins)
    if coins.reduce(0, { $0 + $1}) > startingAmount {
        return
    }
    if coins.reduce(0, { $0 + $1 }) == startingAmount {
        if !combos.contains(coins.sorted()) {
            combos.append(coins.sorted())
        }
        return
    }
    populateCombos(startingAmount, coins: coins + [1])
    populateCombos(startingAmount, coins: coins + [5])
    populateCombos(startingAmount, coins: coins + [10])
    populateCombos(startingAmount, coins: coins + [25])
}

populateCombos(5)
print(combos)
print(combos.count)

//var test = "Test"
//test.la
