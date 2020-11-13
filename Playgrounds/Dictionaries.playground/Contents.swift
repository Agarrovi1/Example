import UIKit

//matrix sum of diagonal (like an x)
//if it's top-left to bottom right, the indices are equal to each other
//if it's the diagonal from the top-right to bottom-left, the indexes must add up to one fewer than the count of indexes

var matrix: [[Int]] = [[1,3,6],[5,7,23],[3,2,0]]

var topLeftDiagonal = 0
var topRightDiagonal = 0
for (outerIndex, arrayElement) in matrix.enumerated() {
    for (innerIndex, intElement) in arrayElement.enumerated() {
        if innerIndex == outerIndex {
            topLeftDiagonal += intElement
        }
        if innerIndex + outerIndex == matrix.count - 1 {
            topRightDiagonal += intElement
        }
    }
}
print(topRightDiagonal + topLeftDiagonal)


//Dictionaries
//can be unordered unlike an array
//type annotation
var a: [String:Int] = ["first":1,"second":2,"third":5,"fourth":7]
//start with square brackets. inside of those, to add key-value pairs, type ****key: value****

a["first"]
print(a["first"])
//^ its an optional
//has to account for not finding a value for a key if they exists
//ex: misplelling "first" as "firs" returns a nil
a["fiftieth"] = 44
print(a["fiftieth"])

var b = (age: 23, dob: 1989)
print(a["sixth"])
//print(b.sixth)
//tuple gives an error because the index does not exist, while dictionaries give nil so no error

var theMets: [String:String] = ["Mr Met": "00", "Adam": "07", "David": "Boo"]
theMets["someKey"] = nil
print(theMets.count)
//^ does not count keys with nil values

//print(theMets.isEmpty)
////checks if the whole/ all the keys are empty
//theMets["Mr Met"] = nil
//theMets["Adam"] = nil
//theMets["David"] = nil
//print(theMets.isEmpty)

//can iterate through a dictionary
for values in theMets.values {
    print(values)
}
for key in theMets.keys {
    print(key)
}

for (k, v) in theMets {
    print(k)
    print(v)
}

for a in theMets {
    print(a)
}
print(theMets["tommy"]?.isEmpty)
print(theMets["Adam"]?.isEmpty)

let set1 = Set([2, 4, 6, 8, 2, 4, 6, 8])
let set2: Set<Int> = [1, 2, 3, 4, 5, 7, 9]
let set3 = set1.intersection(set2)
print(set3)

//Dictionaries Lab

//Q1
var citiesDict = ["US": "Washington DC", "Philippines": "Manila", "South Korea": "Seoul"]
citiesDict["Japan"] = "Tokyo"
citiesDict["Thailand"] = "Bangkok"
//in Russian
citiesDict["Japan"] = "\u{0422}\u{043E}\u{043A}\u{0438}\u{043E}"
citiesDict["South Korea"] = "\u{0421}\u{0435}\u{0443}\u{043B}"
citiesDict["Philippines"] = "\u{041C}\u{0430}\u{043D}\u{0438}\u{043B}\u{0430}"
print(citiesDict)

//Q2
var someDict:[String:Int] = ["One": 1, "Two": 4, "Three": 9, "Four": 16, "Five": 25]

if let key3 = someDict["Three"], let key5 = someDict["Five"] {
        print(key3 + key5)
}

someDict["Six"] = 36
someDict["Seven"] = 49
someDict["productUpToSeven"] = 1
for a in someDict.values {
    if var product = someDict["productUpToSeven"] {
        product *= a
        someDict["productUpToSeven"] = product
    }
}
print(someDict["productUpToSeven"])

someDict["sumUpToSix"] = 0
for (a, b) in someDict {
    if a == "productUpToSeven" || a == "Seven"  {
        continue
    }
    if var sum = someDict["sumUpToSix"] {
        sum += b
        someDict["sumUpToSix"] = sum
    }
}
print(someDict["sumUpToSix"])

someDict["productUpToSeven"] = nil
someDict["sumUpToSix"] = nil

print(someDict)

for (a, b) in someDict {
    if var addTwo = someDict[a] {
        addTwo = b + 2
        someDict[a] = addTwo
    }
}
print(someDict)

//Q3
var authorDict: [String:Double] = ["Mark Twain":8.9, "Nathaniel Hawthorne":5.1, "John Steinbeck":2.3, "C.S. Lewis":9.9, "John Krakauer":6.1]

print(authorDict["John Steinbeck"])

authorDict["Erik Larson"] = 9.2

if let john = authorDict["John Krakauer"], let mark = authorDict["Mark Twain"] {
    if john > mark {
        print("John Krakauer")
    } else {
        print("Mark Twain")
    }
}

for a in authorDict {
    print(a)
}

//Q4
var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

var message = "hello world"

for a in message {
    for (b, c) in code {
        if "\(a)" == "\(b)" {
            print(c, terminator: "")
        }
        }
    if "\(a)" == " " {
        print(" ", terminator: "")
    }
}

var encodedMessage = "uijt nfttbhf jt ibse up sfbe"

for a in encodedMessage {
    for (b, c) in code {
        if "\(a)" == "\(c)" {
            print(b, terminator: "")
    }
}
    if "\(a)" == " " {
        print(" ", terminator: "")
    }
}

//Q5
var people: [[String:String]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen"
    ]
]
//for loop that iterates through the array
//Why? so we have access to the keys/Values in dictionaries?
//we want to pull the values from "firstName" specifically, so we want to iterate through the array to find the value for that key in each dictionary
print("")

var firstNames: [String] = []

for a in people {
    for (b, c) in a {
        if b == "firstName" {
            firstNames.append(c)
        }
    }
}
print(firstNames)

for a in people {
    if let firstName = a["firstName"] {
        firstNames.append(firstName)
    }
}


var fullNames: [String] = []

for a in people {
    if let first = a["firstName"], let last = a["lastName"] {
    fullNames.append("\(first) \(last)")
    }
}
print(fullNames)


//Q6
var peopleWithScores: [[String: String]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": "13"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": "23"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": "10"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": "3"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": "16"
    ]
]
var highest = 0
for a in peopleWithScores {
    for (b, c) in a where b == "score" {
        
        if let num = Int(c) {
            if num > highest {
            highest = num
            }
        }
    }
}

print(highest)
print("\(peopleWithScores[1]["firstName"]) \(peopleWithScores[1]["lastName"])")

for a in peopleWithScores {
    if let first = a["firstName"], let last = a["lastName"], let num = a["score"] {
        print("\(first) \(last) - \(num)")
    }
}


//if let num = Int(c) {
//    if num == highest {
//        if let first = a["firstName"], let last = a["LastName"] {
//            print("\(first) \(last)")
//        }
//    }
//}
//for a in peopleWithScores {
//    for (b, c) in a where b == "score" {
//        if let num
//        if c == highest {
//            print(peopleWithScores[a])
//        }
//    }
//}


//Q7
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var frequency = 0
var numFreq: [Int:Int]
//for a in numbers {
//    for b in numbers {
//        if a == b {
//            frequency += 1
//        }
//    }
//    if !numFreq.contains(a) {
//        numFreq[a] = frequency
//        frequency = 0
//    }
//}
