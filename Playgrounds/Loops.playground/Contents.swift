import UIKit

var str = "Hello, playground"

//for i in 0..<10 {
//    print(i)
//}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//var a = 1
//var b = 5
//var c = 4
//var d = 7
//
//var abcd = (a,b,c,d)

//Loops
let cards = -3...3
var cardsInHand = 0

for ic in 1...5 {
    print("I have \(ic) cards")
}

for _ in 1...5 {
    cardsInHand += 1
    print ("I have \(cardsInHand) cards")
}
print ("I have \(cardsInHand) cards")
//print after {} so only print once

for i in cards {
    cardsInHand += i
    print ("I have \(cardsInHand) cards")
}
print ("I have \(cardsInHand) cards")

//array needs to be same type but does not have to be in order
//5 elements in this array
let numbers = [-1,0,3,2,1]
var sum = 0
for x in numbers {
    sum += x
    //sum = sum + x
    // 1st time sum = 0 + -1 = -1
    // 2nd time sum = -1 + 0 = -1
    // 3rd time sum = -1 + 3 = 2
    // 4th time sum = 2 + 2 = 4
    // 5th time sum = 4 + 1 = 5
}
print("i have \(sum) cards in my hand")

let someRange = 0...11
for even in someRange where even % 2 == 0 {
    print(even)
}
//where will skip anything that does not fit in its condition
//if is like where but can be tweeked to add more details or print out more details
for even in someRange {
    if even % 2 == 0 {
        print(even)
    } else {
        print("that's odd")
    }
}

let arrayOfNames = ["Fredlyne", "Kary", "Kevin", "David"]
var intructor = "David"
for a in arrayOfNames where a != intructor {
    print (a)
}

//while loop
//this will go on indefinitely
//while true {
    //do stuff here
//}

var doIt = true
while doIt {
    doIt = false
}
//the while will keep going until it meets a value of false; make sure it does so it will end
var anyNumber = 0
while anyNumber < 10 {
    print(anyNumber)
    anyNumber += 1
}
var ourRange = 0...4
//while ourRange. {
//    print(anyNumber)
//    anyNumber += 1
//}

var dummyRange = -1
while dummyRange <= 3 {
    print(dummyRange)
    dummyRange += 1
}

var rangeOfNumbers = 0...10
var index = 5
while rangeOfNumbers.contains(index) {
    if index > 3 {
        index -= 1
    continue
        //continues loop until conditions are met then does rest of code
    }
    print(index)
    index -= 1
    //make increment or decrement last action
}
//nested Loop
for p in 1...5 {
    for q in 1...5 {
        print("\(p),\(q)", separator: "", terminator: " ")
    }
    print("")
    //prints on same line instead of another line
}
//will do p first then continue q until it done then next p value
//terminator what to print after print statement
//q runs 25 times then p rund just 5 times

//repeat-while
var i = 0
repeat {
    print(i)
    i += 1
} while i < 10


//LoopsLab
//question 1
//var range = 1...150
//for i in range {
//    print(i)
//}

//question 2
var secondRange = 143..<159
for i in secondRange where i > 142 {
    print(i)
}
for i in secondRange {
    if i > 142 && i < 159 {
        print(i)
    }
}

//question 3
var range = 15...80
for a in range where a % 2 == 0 {
    print(a)
}

//question 4
var aRange = 19...51
for b in aRange where b % 2 != 0 {
    print(b)
}
//question 5
var range5 = 1...100
for j in range5 where j % 5 == 0 && j % 10 != 0 {
    print(j)
}

//question 6
var range6 = 1...40
for seven in range6 {
    if seven % 5 == 0 && seven % 10 != 0 {
        print(seven + 2)
    }
}

//question 7
//var range7 = 20...150
//for three in range7 where three % 3 == 0 {
//    print(three)
//}

//question 8
var range8 = 20...150
for twoAndThree in range8 where twoAndThree % 2 == 0 && twoAndThree % 3 == 0 {
    print(twoAndThree)
}

//question 9
var range9 = 20...150
for four in range9 where four % 10 == 0 && four != 150 {
    print(four + 4)
}

//question 10
var range10 = 20...150
for specific in range10 {
    if specific == 31 || specific == 35 || specific >= 40 && specific <= 60 {
        print(specific)
    }
}

//question 12
//var i = 5
//
//while (i <= 9)  {
//    i += 1
//}

//question 13
//var i = 5
//
//while (i < 1005) {
//    i += 1
//}

//question 14
var w = 5

while (w < 1005) {
    if w % 2 == 0 {
        print(w)
    }
    w += 1
}

//question 15
var y = 1
//loop one
while y <= 10 {
    print("i = \(y)")
    y += 1
}
while rangeOfNumbers.contains(index) {
    if index > 3 {
        index -= 1
        break
        //continues loop until conditions are met then does rest of code
    }
    print(index)
    index -= 1
}

var d = 1...6
var c = 5
//while c > 0 {
//    if c < 3 {
//        c -= 1
//    }
//    break
//    print(c)
//}

