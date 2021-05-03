import UIKit

var str = "Hello, playground"

//Q4
var name: String?
var age: Int?
var height: Double?
if let realName = name, let realAge = age, let realHeight = height {
    print(realName, realAge, realHeight)
} else {
    print("no name, age or height input")
}

//Q5
var firstName: String = "Johnny"
var middleName: String?
var lastName: String = "Stone"

var fullName: String
if let realMiddle = middleName {
    fullName = "\(firstName) \(middleName) \(lastName)"
    } else {
    fullName = "\(firstName) \(lastName)"
}
print(fullName)

//Q6
let myIntString: String? = "35"
if let unwrappedIntString = myIntString {
    if let integerVersion = Int(unwrappedIntString) {
        print(15 + integerVersion)
    }
}

//Q7
var scores: (Int?, Int?, Int?)?

var testCaseOne: (Int?, Int?, Int?)? = (4, nil, 7)
var testCaseTwo: (Int?, Int?, Int?)? = (nil, nil, 9)
var testCaseThree: (Int?, Int?, Int?)? = (5, 10, 24)
var sum: Int = 0

if let test = testCaseThree {
    if let test0 = test.0 {
    sum += test0
    }
    if let test1 = test.1 {
        sum += test1
    }
    if let test2 = test.2 {
        sum += test2
    }
}
print(sum)

//Q8
var tuple: (Int, Int)?
if true {
    tuple = (5, 3)
}
if let realTuple = tuple {
    print("(\(realTuple.0), \(realTuple.1))")
    //print(realTuple.1)
}

//Q9
var myInt: Int?
if Bool.random() {
    myInt = 5
}

if let realInt = myInt {
    print(2 * realInt)
} else {
    print("Error: myInt is nil")
}

//Q10
var myDouble: Double?
let doubleTwo: Double = 5

if Bool.random() {
    myDouble = 12
}

if let realMyDouble = myDouble {
    print(doubleTwo * realMyDouble)
} else {
    print("Error: myDouble is nil")
}

//Q11
var isTheGreatest: Bool?

if Bool.random() {
    isTheGreatest = true
}

isTheGreatest ?? false

//Q12
var myTuple: (Int?, Int?, Int?, Int?)

if Bool.random() {
    myTuple.0 = 5
    myTuple.2 = 14
} else {
    myTuple.1 = 9
    myTuple.3 = 10
}
print(myTuple)
sum = 0
if let realTuple0 = myTuple.0 {
    sum += realTuple0
}
if let realTuple1 = myTuple.1 {
    sum += realTuple1
}
if let realTuple2 = myTuple.2 {
    sum += realTuple2
}
if let realTuple3 = myTuple.3 {
    sum += realTuple3
}
print(sum)

//Q13
//
//| Pokemon       | Stone    |
//| :--------: | :------: |
//| Pikachu       | Electric |
//| Bulbasaur     | Grass    |
//| Charmander | Fire     |
//| Squirtle     | Water    |



// Helper Functions

func eStone() -> String {
    let random = Int(arc4random_uniform(5))
    switch random {
    case 0:
        return "Electric"
    case 1:
        return "Grass"
    case 2:
        return "Fire"
    case 3:
        return "Water"
    default:
        return "No Stone"
    }
}

func starterPokemon() -> String {
    let random = Int(arc4random_uniform(5))
    switch random {
    case 0:
        return "Pikachu"
    case 1:
        return "Bulbasaur"
    case 2:
        return "Charmander"
    case 3:
        return "Squirtle"
    default:
        return "Not a Pokemon"
    }
}

let pokemon: String?
var evolutionaryStone: String?
pokemon = starterPokemon()
evolutionaryStone = eStone()
print(pokemon)
print(evolutionaryStone)
if let stone = evolutionaryStone, let mypoke = pokemon {
        if stone == "Electric" && mypoke == "Pikachu" || stone == "Grass" && mypoke == "Bulbasaur" || stone == "Fire" && mypoke == "Charmander" || stone == "Water" && mypoke == "Squirtle" {
            print("able to evolve")
        } else {
            print("stone is not able to evolve pokemon")
        }
    }


//Q14
var numberOfPeople: Int?

if Bool.random() {
    numberOfPeople = 108
}

if let num = numberOfPeople {
    if num % 2 == 0 {
        print(num)
    }
}

//Q15
var someNumbers: [Int?] = []

for i in 0..<20 {
    someNumbers.append(Bool.random() ? i : nil)
}
var product: Int = 1

print(someNumbers)

for i in someNumbers.indices {
    if let num = someNumbers[i] {
        product *= num
    }
}
print(product)

//Q16
let poorlyFormattedCityNames: [String?] = ["new york", "BOSTON", nil, "chicago", nil, "los angeles", nil, "Dallas",]

var cityNames: [String] = []
for i in poorlyFormattedCityNames.indices {
    if let cities = poorlyFormattedCityNames[i] {
        cityNames.append(cities.uppercased())
    }
}
print(cityNames)

//Q17
var aBunchOfNumbers: [Int?] = []

for _ in 0..<20 {
    aBunchOfNumbers.append(Bool.random() ? Int(arc4random_uniform(102)) : nil)
}
print(aBunchOfNumbers)
var evenNumbers: [Int] = []

for i in aBunchOfNumbers.indices {
    if let numNums = aBunchOfNumbers[i] {
        if numNums % 2 == 0 {
            evenNumbers.append(numNums)
        }
    }
}
print(evenNumbers)

//Q18
let zipCodeStrings = ["11377", "11101", "11373", "10014", "10003", "11223"]

var zipCodeInt: [Int] = []
for i in zipCodeStrings.indices {
    if let zipNums = Int(zipCodeStrings[i]) {
        zipCodeInt.append(zipNums)
    }
}
print(zipCodeInt)

//Q19
let studentInfo: [(String, String?, String?)] = [("Bill", "Burgers", "Blue"), ("Rita", nil, "Red"), ("Peter", "Pizza", "Purple"), ("Sarah", "Sandwiches", nil), ("Jeff", nil, nil), ("Lucy", "Leftovers", "Lilac"), ("Mike", "Meat", "Mauve"), ("Gemma", nil, "Green")]

var studentFoodColor: [(String, String, String)] = []
for a in studentInfo.indices {
    if let _ = studentInfo[a].2 {
    } else {
        print("\(studentInfo[a].0) does not have a favorite color")
    }
    if let food = studentInfo[a].1, let color = studentInfo[a].2 {
        studentFoodColor.append((studentInfo[a].0, food, color))
    } else {
        print("\(studentInfo[a].0) does not have a favorite food or color")
    }
}
print(studentFoodColor)

//Q20
let possibleColors: [(r: UInt8?, g: UInt8?, b: UInt8?)?]? = [(128, 21, 7), (0, 0, 0), nil, (nil, 25, 82), (255, 255, 255), nil, (200, 100, nil), (120, nil, 23), (0, 255, 106), (nil, nil, nil), nil, (100, 100, 200)]
var nilCount = 0
if let unwrappedColors = possibleColors {
    for a in unwrappedColors.indices {
        if let unwrappedTuples = unwrappedColors[a] {
            if let tuple0 = unwrappedTuples.0, let tuple1 = unwrappedTuples.1, let tuple2 = unwrappedTuples.2 {
                let tupleColor = (tuple0, tuple1, tuple2)
                print(tupleColor)
            } else {
                nilCount += 1
            }
        } else {
            nilCount += 1
        }
    }
}
print(nilCount)
//Q21
let number: Int??? = 10
//force unwrap
print(number!!!)

//optionally bind
if let bind1 = number {
    if let bind2 = bind1 {
        if let bind3 = bind2 {
            print(bind3)
        }
    }
}

//Q22
let monkeyingAround: [String?] = ["orangutan", "apes",nil, "monkeys", "gorillas", "lemurs", nil]
var vowels = "aeiou"

var concatenateMonkey = ""
for a in monkeyingAround.indices {
    if let unwrapped = monkeyingAround[a] {
    var vowelCount = 0
    for b in unwrapped {
       if vowels.contains(b) {
            vowelCount += 1
        }
    }
        if vowelCount < 3 {
            concatenateMonkey.append(unwrapped)
    }
    }
}
print(concatenateMonkey)

//Q23
var strangeStructure: ([Int]?, [[Int?]], [[Int]?], Int)? = ([1], [[2,3,4],[],[5,nil],[nil]], [nil, [6,7,8],nil,[],[9]], 10)

if let tupleItself = strangeStructure {
    if let tuple0 = tupleItself.0 {
        print(tuple0)
    }
    for a in tupleItself.1 {
        for b in a {
            if let unwrapFromTuple1 = b {
                print(unwrapFromTuple1)
            }
        }
    }
    for a in tupleItself.2 {
        if let arrayInTuple2 = a {
            for b in arrayInTuple2 {
                print(b)
            }
        }
    }
    print(tupleItself.3)
}
