import UIKit

//Functions: block of code that we can call on elsewhere that runs the code that we defined. sometimes has parameters are arguments. sometimes has a specific type of return. What you write in it is unique to what's in it <--- if you declare variables in it, you can only use them within it (SCOPE)
func someFunction() {
    //the stuff it does
    //print something
    //compute something and return a value
    //some other stuff that we might have done, like transforming a hidden word based on some input from the user who enters that input in the terminal in, well, for example, a game like Hangman
}


//functionality - what the code is going to do

//Closures - can be treated like any other type, such as an Int or a string
//can be a chunk that itself can be moved around and treated as any typ like a Int or String

//some behavior inside the curly braces
//dont need a keyword. We also dont need a name.
//when a closure has no name, its called an anonymous closure
//{ (a: Int, b: Int) -> Int in //need keyword "in" at end of line
//    return a + b
//}

//a closure given a name
let add = { (a: Int, b: Int) -> Int in //need keyword "in" at end of line
    return a + b
}

//we didnt need to give argument names.
var sum = add(2,3)
print(sum)

let addExampleTwo: (Int, Int) -> Int = { (a,b) in
    return a + b
}

let subtraction: (Int,Int) -> Int = { (a,b) in
    return a - b
}

let multiply: (Int,Int) -> Int = { (a,b) in
    return a * b
}

let divide: (Int,Int) -> Int? = { (a,b) in
    if b != 0 {
        return a / b
    }
    return nil
}

//get 'er method
//this is also a closure
let showMeC = {
    return "c"
}

print(showMeC())
print({
    return "c"
}()/*using the closure with ()*/)
//line
//line 59 - 61is an anonymous closure

var arrayOveStrings = ["an","apple","fell","on","newton's","head"]
//mutates the array
//arrayOveStrings.sort()

//does not mutate the original array.
//returns a new sorted array that must be saved to a variable to be used
let sortedArray = arrayOveStrings.sorted()
arrayOveStrings.sorted()
print(sortedArray)

func compareTwoString(a: String, b: String) -> Bool {
    return a > b
}
//^ (String, String) throws -> Bool from .sorted(by:)
let sortingAnArray = arrayOveStrings.sorted(by: compareTwoString)
//don't need to call function/block of code, we just need to tell our sorted method that there's a block of code that works in the way that it's asking for.
let sorted = arrayOveStrings.sorted(by: {(a: String, b: String) -> Bool in
    return a > b //letters closer to z are first or reversed alphabet or descending order
})
//put ^ in one line/ smaller v
//let sorted = arrayOveStrings.sorted(by: {(a,b) in a > b})
let tuple = (1,2)
tuple.0
tuple.1
let sortedSmall = arrayOveStrings.sorted(by: { $0 > $1})
let sortedEvenSmaller = arrayOveStrings.sorted(by: > )
//predicate
//arrayOveStrings.sorted(by: <#T##(String, String) throws -> Bool#>)
//type inference

//that same closure but used in a different place
let exampleOne = arrayOveStrings.sorted() {$0 > $1 }

let nums = [32,21,33,2,66,88,43,902,73,27,905]
let ws = ["One","two","Buckle","my","shoe"]
let ascendingNums = nums.sorted(by: {$0 < $1})
let decendingWords = ws.sorted() {(a,b) in a.lowercased() > b.lowercased()}
print(ascendingNums)
print(decendingWords)

//Reduce
let newArray = [33,52,73,138,899,326,1009,1970]
let reduceResult = newArray.reduce(0, +)
//let reduceResult = newArray.reduce(0, {$0 + $1})
let multiplyEachByThree = newArray.reduce(0,{($0 + $1) * 3 })

let filterArray = newArray.filter({a -> Bool in
    return a % 2 == 0
})
print(filterArray)

//Map
//let thoseIntsMultipliedByThree = newArray.map({$0 * 3})
let thoseIntsMultipliedByThree = newArray.map({a -> Int in
    return a * 3
})
//<#T##transform: (Int) throws -> T##(Int) throws -> T#>
print(thoseIntsMultipliedByThree)


//Closure Lab
//Q1
func applyKTimes(_ K: Int, _ closure: () -> ()) {
    for _ in 1...K {
        closure()
    }
}

applyKTimes(3) {
    print("Hello Closures!")
}

//Q2
//let numbers = [1, 2, 3, 4, 6, 8, 9, 3, 12, 11]
//
//let multiples = numbers.filter() { $0 % 3 == 0 }
//print(multiples)

//Q3
let numbers = [4, 7, 1, 9, 6, 5, 6, 9]
let compare = { (x: Int,y: Int) -> Int in
    return x > y ? x : y
    //same as ...
//    if x > y {
//        return x
//    }
//    return y
}
let largesNum = numbers.reduce(0, {compare($0, $1)})
//<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>
print(largesNum)

//Q4
let strings = ["We", "Heart", "Swift"]
let addNext = { (x: String, y: String) -> String in
    var blank = x
    blank += y
    blank += " "
    return blank
}

//let altogetherNow = strings.reduce(String.init(), {addNext($0, $1)})
let altogetherNow = strings.reduce("", { $0 + " " + $1 } )
let altogetherNow2 = strings.reduce("", {if $0 == "" {return $1} else {return $0 + " " + $1}})
print(altogetherNow2)

//Q5
let cities = ["Shanghai", "Beijing", "Delhi", "Lagos", "Tianjin", "Karachi", "Karachi", "Tokyo", "Guangzhou", "Mumbai", "Moscow", "São Paulo"]

//Q5 a
let alphabetized = cities.sorted(by: {$0 < $1})
print(alphabetized)

//Q5 b
let sortBySecondLetter = {(a: String, b: String) -> Bool in
    return a.dropFirst() < b.dropFirst()
}
let secondLetter = cities.sorted(by: {(a: String, b: String) -> Bool in
    return a.dropFirst() < b.dropFirst()
})
print(secondLetter)

//Q5 c
let sortByLength = cities.sorted(by: {(a,b) -> Bool in
    return a.count < b.count
})
print(sortByLength)

//Q6
let citiesWithPopulation: [(String, Int)] = [("Shanghai", 24256800), ("Beijing", 21516000), ("Delhi", 16787941), ("Lagos", 16060303), ("Tianjin", 15200000), ("Karachi", 14910352), ("Karachi", 14160467), ("Tokyo", 13513734), ("Guangzhou", 13080500), ("Mumbai", 12442373), ("Moscow", 12380664), ("São Paulo", 12038175)]


//Q6 a
let sortByPopulation = citiesWithPopulation.sorted(by: {(a: (String,Int), b: (String,Int)) -> Bool in
    return a.1 < b.1
})
print(sortByPopulation)

//Q6 b
let sortByLastCharacter = citiesWithPopulation.sorted(by: {(a: (String,Int), b: (String,Int)) -> Bool in
    var value = Bool()
    if let realA = a.0.last {
        if let realB = b.0.last {
            value = realA > realB
        }
    }
    return value
})
print(sortByLastCharacter)


