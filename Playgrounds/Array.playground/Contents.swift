import UIKit

var str = "Hello, playground"

//Array


var yup = true
var aNumber = 9

//collection of stuff
var saySomething = "something"
var tuple = (a: "firstThing", b: "secondThing")
var tuple2: (String,String,String) = ("Something","something else","Blah")
//tuple annotation means we have to explicitly tell the computer what type will be in *EACH* space
var range = 0...10
range.contains(3)

//array - can have anything!
var array = ["Malcolm","Olimpia","Angela","Rad","Bee","Liana"]
//count of items in the array is one more than the last index. Soooooo the last index is one fewer than the count of items

//type annotation
//makes it expect the stuff in it to be strings
var array1: [String] = ["Malcolm","Olimpia","Angela","Rad","Bee","Liana"]
var arrayOfNumbers: [Int] = [1,2,3,4,5]

//take this array of numbers and print out the sum when you add all five numbers together
print(arrayOfNumbers.reduce(0, +))
var sum = 0
for number in arrayOfNumbers {
    sum += number
}
print(sum)

//how to find the first character in a string
var string = "what is this string index stuff"
string.first == string[string.startIndex]
var endIndex = string.endIndex
string.last == string[string.index(before: string.endIndex)]

//indexes in arrays! they're easier
arrayOfNumbers.first == arrayOfNumbers[0]
arrayOfNumbers.last == arrayOfNumbers[4] && arrayOfNumbers.last == arrayOfNumbers[arrayOfNumbers.endIndex - 1]


var sent = "i didn't eat breakfast"
var sentArray = Array(sent)
//print(sentArray.last)
//^makes an optional

print(sentArray.max()) //looks at the highest index
print(sentArray.count)
//loop through and print out each word
var blank = ""
for a in sentArray {
    if String(a) == " " {
        print(blank)
        blank = ""
        continue
    }
    blank += String(a)
}
print(blank)


let array01 = ["some","thing","in","here"]
let array02 = ["other","stuff","in","here"]
let array03 = [1,"2",3,4] as [Any]
let arrayOfArrays = [array01,array02]
print(arrayOfArrays) //type is an array of arrays of strings || [[String]]
//can make an array of arrays
//dont have to have the same number of elements in the array but should be same type of array
print(arrayOfArrays[1])
print(arrayOfArrays[1][1])


//String lab 2 Review
var sentence = "i didn't eat breakfast"
var space = " "
var currentWord = ""
for character in sentence {
    if String(character) == space {
        print(currentWord)
        currentWord = ""
        continue
    }
    currentWord += String(character)
}
print(currentWord)

//Array Lab
//Q1
var arrayQ1: [String] = ["orange", "red", "yellow", "turquoise", "lavender"]

var favColors = "\(arrayQ1[0]), \(arrayQ1[2]), and \(arrayQ1[4])"
favColors += " are some of my favorite colors"
print(favColors)

//Q2
var westernStates = ["California", "Oregon", "Washington", "Idaho", "Illinois", "Kansas"]
westernStates.remove(at: 4)
westernStates.remove(at: 4)
print(westernStates)

//Q3
let moreStates = ["Hawaii", "New Mexico", "Alaska", "Montana", "Texas", "New York", "Florida"]
for a in moreStates {
    if a == "Hawaii" || a == "Alaska" {
        print("\(a): is not in the continental United States.")
    } else {
    print("\(a): is in the continental United States.")
    }
}

//Q4
let myString = "This is good practice with Strings!"
let myFavoriteQuotes = ["To be or not to be, that is the question.", "The only source of knowledge is experience.", "Mr. Gorbachev, tear down this wall!", "Four score and twenty years ago..."]
var count = 0
for a in myFavoriteQuotes.indices {
    for b in myFavoriteQuotes[a] {
        if "\(b)" != " " {
            count += 1
            continue
    }
    }
    print(count)
    count = 0
}

//q5
var garden = ["dirt","🌷","dirt","🌷","dirt","dirt","🌷","dirt","🌷","dirt"]
var basket = [String]()
for a in garden.indices {
    if garden[a] == "🌷" {
        basket.append("🌷")
        garden[a] = "dirt"
    }
}
print(basket.count)

//q6
var battingLineup = ["Reyes", "Jeter", "Ramirez", "Pujols","Griffey","Thomas","Jones", "Rodriguez"]
battingLineup.remove(at: 0)
battingLineup.append("Reyes")
battingLineup.append("Suzuki")
battingLineup[1] = "Tejada"
battingLineup[5] = "Guerrero"
print(battingLineup)

//q7
var numbers: [Int] = [1,3,5,3,77,100]
let target: Int = 32
var targetCount = 0
for a in numbers {
    if a == target {
        targetCount += 1
    }
}
if targetCount >= 1 {
    print("true")
} else {
    print("false")
}

//q8
let arrayOfNumbers8: [Int] = (1...100).map{ _ in Int.random(in: 0...200)}.map{Int($0)}
var num = 0
for a in arrayOfNumbers8 {
    if a >= num {
        num = a
    }
}
print(num)

//q9
let arrayOfNumbers9: [Int] = (1...100).map{ _ in Int.random(in: 0...200)}.map{Int($0)}
num = 200
for a in arrayOfNumbers9 {
    if a <= num {
        num = a
    }
}
print(num)

//q10
var secondListOfNumbers = [19,13,14,19,101,10000,141,404]
for a in secondListOfNumbers {
    if a % 2 != 0 {
        print(a)
    }
}

//q11
var thirdListOfNumbers = [11, 26, 49, 61, 25, 40, 74, 3, 22, 23]
num = 0
for a in thirdListOfNumbers {
    num += a
}
print(num)

//q12
for a in thirdListOfNumbers {
    if a % 2 == 0 {
        print(a)
    }
}

//q13
var listOne = [28, 64, 7, 96, 13, 32, 94, 11, 80, 68]
var listTwo = [18, 94, 48, 6, 42, 68, 79, 76, 13, 7]
var sharedElements = [Int]()

for a in listOne {
    sharedElements.append(a)
}
for a in listTwo {
    sharedElements.append(a)
}
print(sharedElements.count)

//q14
var dupeFriendlyList = [4,2,6,2,2,6,4,9,2,1]
var noDupeList: [Int] = []
for a in dupeFriendlyList {
    if !noDupeList.contains(a) {
        noDupeList.append(a)
    }
}
print(noDupeList)

//q15
num = 200
var num2nd = 100
for a in arrayOfNumbers9 {
    if a < num {
       num = a
    } else if a < num2nd {
        num2nd = num
    }
}
print(num2nd)

//q16
var arrayQ16: [Int] = []
for a in 0..<1000 {
    if a % 3 == 0 || a % 5 == 0 {
        arrayQ16.append(a)
    }
}
sum = 0
for a in arrayQ16 {
    sum += a
}
print(sum)

//q17
var someRepeatsAgain = [25,11,30,31,50,28,4,37,13,20,24,38,28,14,44,33,7,43,39,35,36,42,1,40,7,14,23,46,21,39,11,42,12,38,41,48,20,23,29,24,50,41,38,23,11,30,50,13,13,16,10,8,3,43,10,20,28,39,24,36,21,13,40,25,37,39,31,4,46,20,38,2,7,11,11,41,45,9,49,31,38,23,41,16,49,29,14,6,6,11,5,39,13,17,43,1,1,15,25]
var arrayQ17: [Int] = []
var repeatCount = 0
for a in someRepeatsAgain.indices {
    for b in someRepeatsAgain {
        if someRepeatsAgain[a] == b {
            repeatCount += 1
        }
        if repeatCount > 2 && !arrayQ17.contains(b){
            arrayQ17.append(b)
            repeatCount = 0
        }
    }
}
print(arrayQ17)


