import UIKit

var str = "Hello, playground"

//going over question 20 in loops lab
let xRange = 0...10
let yRange = 0...10
//nested loop
for x in xRange {
    for y in yRange {
        let tuple = (x,y)
        print(tuple)
    }
}

//Strings

//making an empty string
var emptyString =  String()

let someNewString = String( "some Stuff")

var someOtherString = String(repeating: "A", count: 3)
let something =  String(stringLiteral: "a string that we're typing in")
someOtherString.append(contentsOf: " Add me")
someOtherString += " add Me"

//first create string
// then create an integer
//then in one step use string interpolation to append the value of the integer and the phrase " and my number is ___" to your string

var ourString = "My name is Jocelyn"
var ourInteger = 4
print(ourString + " and my number is \(ourInteger)")

//Iteration
//a string is iterable
//to check for iterability put in a for loop

//for a in [a,b,c] {
//
//}

for c in "i'm really hungry" {
    print(c)
}
//it goes through each character in the string even spaces, apostraphes, etc

var davidStatus = "i'm also really hungry"
print(davidStatus.count)
//make every letter in string uppercase
print(davidStatus.localizedUppercase)
print(davidStatus.uppercased())

//print string but first letter missing
print(davidStatus.dropFirst())
print(davidStatus)
//didn't assign new value to variable in print command

//print in reverse
print(String(davidStatus.reversed()))
var string = ""
for b in davidStatus {
    string = "\(b)" + string
}
print(string)

//can chain methods together
var beeStatus = "i need food"
print(beeStatus.uppercased().lowercased())
beeStatus = String(beeStatus.dropFirst())
//type conversion

print(beeStatus.reversed())

//String Lab

//Q1
//var single = ""
//for a in 1...10 {
//    single = single + " \(a)"
//}
//print(single)

//Q2
//single = ""
//for a in 5...51 where a % 2 == 0 {
//    single = single + " \(a)"
//}
//print(single)

//Q3
var single = ""
for a in 1...60 where a % 5 == 0 && a % 10 != 0 {
    single = single + " \(a - 1)"
}
print(single)

//Q4
var stringQ4 = "Hello world!"
for a in stringQ4 {
    print(a)
}

//Q5
let myStringSeven = "Hello world!"
print(myStringSeven.last!)

//q6
var stringQ6 = "anythings"
stringQ6.enumerated()
for (a, b) in stringQ6.enumerated() {
    if stringQ6.count % 2 == 0 {
        print(b)
    } else if a % 2 == 0 {
        print(b)
    }
}

//switch stringQ6.count % 2 == 0 {
//case true {
//    for a in stringQ6 {
//        print(a)
//    }
//    }
//case false {
//    print(stringQ6.index(after: String.Index))
//    }
//}

//Q7
//var q7 = Character("a")
//var qq7 = String("a")
//print(qq7 == q7)
//q8
let p = "\u{00A2}"
let q = "¢"
print(p == q)

let a = "\u{00A3}"
let b = "£"
print(a == b)

let c = "\u{00A9}"
let cr = "©"
print(c == cr)

let s = "\u{00A7}"
let t = "§"
print(s == t)

let i = "\u{30DB}"
let j = "ホ"
print(i == j)

//q9
//HELLO WORLD
print("\u{0048}\u{0045}\u{004C}\u{004C}\u{004F}\u{0020}\u{0057}\u{004F}\u{0052}\u{004C}\u{0044}")

//q10
print("\u{0041}\u{004E}\u{0047}\u{0045}\u{004C}\u{0041}")

//q11
print("\u{3053}\u{3093}\u{306B}\u{3061}\u{306F}\u{4E16}\u{754C}")

//q12

let dashes = "- - - - - - - - - - - "
var outline = String(repeating: "- ", count: 11)
let flower = "| \u{2698} | \u{2698} | \u{2698} | \u{2698} | \u{2698} |"
//var flowers = String(repeating: "| \u{2698} ", count: 5)
//print("| \u{2698} | \u{2698} | \u{2698} | \u{2698} | \u{2698} |")
for a in 0...8 {
    if a == 0 || a == 8 {
        print(outline)
    } else {
        print(flower)
    }
}

//q13
var whiteRow1 = "\u{2656} \u{2658} \u{2657} \u{2655} \u{2654} \u{2657} \u{2658} \u{2656}"
var whiteRow2 = "\u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659} \u{2659}"
var blackRow1 = "\u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F} \u{265F}"
var blackRow2 = "\u{265C} \u{265E} \u{265D} \u{265B} \u{265A} \u{265D} \u{265E} \u{265C}"
for a in 1...8 {
    if a == 1 {
        print(whiteRow1)
    } else if a == 2 {
        print(whiteRow2)
    } else if a == 7 {
        print(blackRow1)
    } else if a == 8 {
        print(blackRow2)
    } else {
        print("")
    }
}

//q14
//var aString = "Replace the letter e with *"
////for e in aString where e == "e" {
////    aString.rep
////}
//print(aString.replacingOccurrences(of: "e", with: "*"))

//q15
//var aString = "this string has 29 characters"
//var reverse = ""
//for a in aString {
//    reverse = "\(a)" + reverse
//}
//print(reverse)

//q16
let aString = "anutforajaroftuna"
var reverse = ""
for a in aString {
    reverse = "\(a)" + reverse
}
if aString == reverse {
    print("true")
} else {
    print("false")
}

//q17
//var problem = "split this string into words and print them on separate lines"
//var word = ""
//for a in problem.components(separatedBy: " ") {
//    print("\(a)")
//}

//q18
var problem = "find the longest word in the problem description"
var wordsArray = problem.components(separatedBy: " ")
var longestWord = wordsArray.max(by: {$1.count > $0.count})
print(longestWord!)

//q19
let vowels = "aeiou"
let consonants = "bcdfghjklmnpqrstvwxyz"
let input = "Count how many vowels I have!"
var vowelCount = 0
var consonantCount = 0
for a in input.uppercased() {
    for b in vowels.uppercased() {
        if b == a {
            vowelCount += 1
        }
    }
    for c in consonants.uppercased() {
        if c == a {
            consonantCount += 1
        }
    }
}
var tuple = (vowels: vowelCount, consonants: consonantCount)

//q20
var sample = "a sample of words"
print(sample.components(separatedBy: " ").last!.count)

