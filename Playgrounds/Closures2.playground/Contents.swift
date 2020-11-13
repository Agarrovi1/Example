import UIKit

//Q7
var numbers = [1, 2, 3, 4, 5, 6]
func numberOfDivisors (x: Int) -> Int {
    var count = 0
    for i in 1...x {
        if x % i == 0 {
            count += 1
        }
    }
    return count
}
let divisors = {(a: Int, b: Int) -> Bool in
    return numberOfDivisors(x: a) < numberOfDivisors(x: b)
}
let sortByDivisors = numbers.sorted() {divisors($0, $1)}
print(sortByDivisors)

//Q8
//Q8a
numbers = [1, 2, 3, 4, 5, 6]
let oddNumOut = numbers.filter({$0 % 2 != 0 })
print(oddNumOut)

func oddNumOutFunc(arr:[Int]) -> [Int] {
    var newArr: [Int] = []
    for a in arr {
        if a % 2 != 0 {
            newArr.append(a)
        }
    }
    return newArr
}
print(oddNumOutFunc(arr: numbers))

//Q8b
let squareAll = numbers.map({(a) -> Int in a * a })
print(squareAll)
func squareAllFunc(arr:[Int]) -> [Int] {
    var newArr: [Int] = []
    for a in arr {
        newArr.append(a * a)
    }
    return newArr
}
print(squareAllFunc(arr: numbers))

//Q8c
let sum = numbers.reduce(0, +)
print(sum)

func sumFunc(arr:[Int]) -> Int {
    var newAns = 0
    for a in arr {
        newAns += a
    }
    return newAns
}
print(sumFunc(arr: numbers))
//Q8d
let oddSquareSum = numbers.filter({$0 % 2 != 0 }).map({(a) -> Int in a * a }).reduce(0, +)
print(oddSquareSum)

//Q9
func forEach(array: [Int], _ closure: (Int) -> ()) {
    for a in array{
        closure(a)
    }
}

forEach(array: [1, 2, 3, 4]) {
    print($0 * $0)
}

//Q10
func combineArrays(array1: [Int], array2: [Int], _ closure: (Int,Int) -> (Int)) -> [Int] {
    var newArray: [Int] = []
    let lastIndex = array1.count - 1
    for a in 0...lastIndex {
        let new = closure(array1[a],array2[a])
        newArray.append(new)
    }
    return newArray
}


var array1 = [1,2,3,4]
var array2 = [5,5,5,3]
var answer = combineArrays(array1: array1,array2: array2) {
    $0 * $1
}
print(answer)

//Q11a
let theInts = [1, 2, 3, 44, 555, 6600, 10763]
//func intsToStrings(arrayOfInts: [Int]) -> [String] {
//    let stringArray = arrayOfInts.map({(a) -> String in
//        return String(a)
//    })
//    return stringArray
//}
//intsToStrings(arrayOfInts: theInts)

//Q11b
let asString = {(a: Int) -> String in
    return String(a)
}
asString(1)
//func intsToStrings(arrayOfInts: [Int]) -> [String] {
//    var stringArray:[String] = []
//    for a in arrayOfInts {
//        let new = asString(a)
//        stringArray.append(new)
//    }
//    return stringArray
//}

//Q11c
let evenOdd = {(a: Int) -> String in
    return a % 2 == 0 ? "even" : "odd"
}

//func intsToStrings(arrayOfInts: [Int]) -> [String] {
//    var stringArray:[String] = []
//    for a in arrayOfInts {
//        let new = evenOdd(a)
//        stringArray.append(new)
//    }
//    return stringArray
//}

let englishWords = {(a:Int) -> String in
    var value = String()
    let stringDigit = String(a)
    let english = ["0":"zero","1":"one","2":"two","3":"three","4":"four","5":"five","6":"six","7":"seven","8":"eight","9":"nine"]
    for i in stringDigit {
        if let unwrap = english["\(i)"] {
            value = value + " " + unwrap
        }
    }
    return value
}
print(englishWords(234))

func intsToStrings(arrayOfInts: [Int]) -> [String] {
    var stringArray:[String] = []
    for a in arrayOfInts {
        let new = englishWords(a)
        stringArray.append(new)
    }
    return stringArray
}

intsToStrings(arrayOfInts: theInts)

//Q11e
let a = theInts.map({(a:Int) -> String in
    String(a)})
let b =  theInts.map({(a:Int) -> String in
    return a % 2 == 0 ? "even" : "odd"
})
let c = theInts.map({(a:Int) -> String in
    let stringIt = String(a)
    var answer = ""
    let english = ["0":"zero","1":"one","2":"two","3":"three","4":"four","5":"five","6":"six","7":"seven","8":"eight","9":"nine"]
    for i in stringIt {
        if let unwrap = english["\(i)"] {
            answer = answer + "\(unwrap) "
        }
    }
    return answer
})
print(a)
print(b)
print(c)

//Q12
var myArray = [34,42,42,1,3,4,3,2,49]
//Q12a

let ascendingOrder = {(x:Int,y:Int) -> Bool in x < y}
let mySortedArray = myArray.sorted(by: ascendingOrder)

//Q12b
let descendingOrder = {(x:Int,y:Int) -> Bool in x > y}
let mySecondSortedArray = myArray.sorted(by: descendingOrder)

//Q13a
let arrayOfArrays = [[3,65,2,4],[5,5],[25,3,1,6],[245,2,3,5,74]]
//let compareThirdElement = {(x:[Int],y:[Int]) -> Bool in
//    return x[2] < y[2]
//}
//let sortedArrayOfArrays = arrayOfArrays.sorted(by: compareThirdElement)
//
//let descendingArrayCount = {(x:[Int],y:[Int]) -> Bool in
//    return x.count > y.count
//}

//let compareThirdElement = {(x:[Int],y:[Int]) -> Bool in
//    if x.count >= 3 && y.count >= 3 {
//        return x[2] < y[2]
//    } else {
//        return true
//    }
//
//}


//Q14a
let letterValues = [
    "a" : 54,
    "b" : 24,
    "c" : 42,
    "d" : 31,
    "e" : 35,
    "f" : 14,
    "g" : 15,
    "h" : 311,
    "i" : 312,
    "j" : 32,
    "k" : 93,
    "l" : 203,
    "m" : 212,
    "n" : 41,
    "o" : 102,
    "p" : 999,
    "q" : 1044,
    "r" : 404,
    "s" : 649,
    "t" : 414,
    "u" : 121,
    "v" : 838,
    "w" : 555,
    "x" : 1001,
    "y" : 123,
    "z" : 432
]

var codeString = "aldfjaekwjnfaekjnf"
let descending = {(x:Character, y:Character) -> Bool in
    var ans = true
    if let unwrapX = letterValues["\(x)"],let unwrapY = letterValues["\(y)"] {
        ans = unwrapX > unwrapY
    }
    return ans
}
var sortingWithDict = String(codeString.sorted(by: descending))
print(sortingWithDict)


//Q14b
let ascending = {(x:Character, y:Character) -> Bool in
    var ans = true
    if let unwrapX = letterValues["\(x)"],let unwrapY = letterValues["\(y)"] {
        ans = unwrapX < unwrapY
    }
    return ans
}

var codeStringTwo = "znwemnrfewpiqn"
var sortingAgain = String(codeStringTwo.sorted(by: ascending))

//Q15
let firstAndLastTuples = [("Johann S.", "Bach"),
                          ("Claudio", "Monteverdi"),
                          ("Duke", "Ellington"),
                          ("W. A.", "Mozart"),
                          ("Nicolai","Rimsky-Korsakov"),
                          ("Scott","Joplin"),
                          ("Josquin","Des Prez")]
let sortingTuple = {(x:(String,String),y:(String,String)) -> Bool in
    return x.1 < y.1
}

var tupleByLastName = firstAndLastTuples.sorted(by: sortingTuple)
for i in tupleByLastName {
    print("\(i.1), \(i.0)")
}
func printTheTuples(arrayOfTuples: [(String,String)], _ closure: () -> ()) {
    for _ in arrayOfTuples {
        closure()
    }
}


//Q16
let theDoubles = [11.45, 3.2, 4.0, 5.67, 58.65, 66.0, 5.2, 5.0]
//a
func myFilter(arr: [Double], _ closure: (Double) -> Bool) -> [Double] {
    var newArr: [Double] = []
    for a in arr {
        if closure(a) == true {
            newArr.append(a)
        }
    }
    return newArr
}
//b
let biggerThanTen = {(x: Double) -> Bool in
    return x >= 10.0
}

print(myFilter(arr: theDoubles) {biggerThanTen($0)})

//c
let wholeNumber = {(x:Double) -> Bool in
    return x.truncatingRemainder(dividingBy: 1.0) == 0
}

print(myFilter(arr: theDoubles) {wholeNumber($0)})

//d
let justEven = {(x:Double) -> Bool in
    return Int(x) % 2 == 0
}

print(myFilter(arr: theDoubles) {justEven($0)})

//e
print(theDoubles.filter(biggerThanTen))
print(theDoubles.filter(wholeNumber))
print(theDoubles.filter(justEven))

//ask about Q13
