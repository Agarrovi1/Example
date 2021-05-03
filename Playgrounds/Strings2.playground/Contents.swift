import UIKit

var str = "Hello, playground"

//Strings day 2

//What's Unicode?
//ex: unicode of one chara
var unicodeSomething = "\u{00cd}"
//capital I with an acute symbol on top

var unicodeSomethingElse = "\u{0049}\u{0301}"
//unicode scalars
// an I and an acute symbol
//with no space code will try to put them together if it can

print(unicodeSomething == unicodeSomethingElse)
//canonical equivalence - the agreed upon meaning
//comparing values of the two scalars
//uses cocoa library to check if these scalars are the same value

print("\u{2698}\u{0301}")
var a = "Í"
print(a.unicodeScalars.shuffled())
print(a.unicodeScalars.sorted())

//why is an array not an array?
var array = [1,2,4,5]
print(array[0])
var myString = "this is a collection of characters"
print(myString.startIndex)
myString[myString.startIndex]
myString.last //returns a character
myString.endIndex //returns a string.index
let myStringStart = myString.startIndex
var somewhereInside = myString.index(myStringStart, offsetBy: 2)
print(myString[somewhereInside])

//to find the last character
var endIndex = myString.endIndex
var indexBeforeEnd = myString.index(before: endIndex)
print(myString[indexBeforeEnd])
//print(myString[0])
//cant directly look at the place of a character to find index
//instead, we're going to have to use String.index

//Strings Lab 2
//Q1
var problem = "split this string into words and print them on separate lines"
for a in problem.components(separatedBy: " ") {
    print("\(a)")
}

//Q2
let testString = "  How   about      thesespaces  ?  "
var condensedString = testString.replacingOccurrences(of: "  ", with: " ").trimmingCharacters(in: .whitespaces)
testString.replacingOccurrences(of: "  ", with: " ")
var answer = " How about thesespaces ? "
print(condensedString)

//Q3
//var sample = "Swift is the best language"
//var reversed = sample.components(separatedBy: " ")
//var answerQ3 = ""
//for a in reversed {
//    answerQ3 = "\(a) " + answerQ3
//}
//print(answerQ3)

//Q4
var sample = "danaerys dad cat civic bottle"
var palindromeCount = 0
for a in sample.components(separatedBy: " ") {
    if a == String(a.reversed()) {
        palindromeCount += 1
    }
}
print(palindromeCount)

//Q5
var sampleQ5 = "PPALLAPL"
var L = "LLL"
var A = 0
for a in sampleQ5 {
    if a == "P" {
       continue
    }else if a == "A" {
        A += 1
   }
}
if sampleQ5.contains(L) == true || A > 1 {
    print("false")
} else {
    print("true")
}
    
    
    
  //      if a == "L" {
//        L = "\(a)" + L
//    } else if L == "LLL" {
//        print("false")
//        break
//    } else if A > 1 {
//        print("false")
//        break
//    }
//}
    
//.contains

//if A <= 1 && L != "LLL" {
//    print("true")
//}
//Q6

var sampleQ6 = ("aa", "aaba")
var Ransom = sampleQ6.0
var Mag = sampleQ6.1
let vowels = "aeiou"
let consonants = "bcdfghjklmnpqrstvwxyz"
var vowelCountM = 0
var consonantCountM = 0
var vowelCountR = 0
var consonantCountR = 0
for a in Mag {
    for b in vowels {
        if a == b {
            vowelCountM += 1
        }
    }
    for c in consonants {
        if c == a {
            consonantCountM += 1
        }
    }
}

for a in Ransom {
    for b in vowels {
        if a == b {
            vowelCountR += 1
        }
    }
    for c in consonants {
        if c == a {
            consonantCountR += 1
        }
    }
}
if vowelCountR <= vowelCountM && consonantCountR <= consonantCountM {
    print("true")
} else {
    print("false")
}


//another try for Q6
var sampleInput = ("abb", "aab")
var ransomNote = sampleInput.0
var magazine = sampleInput.1
var blankVowels = ""
var blankConsonants = ""
for letter in ransomNote {
    for a in "a" {
        if a == letter {
        blankVowels += "\(a)"
        }
    }
    for b in "b" {
        if letter == b {
        blankConsonants += "\(b)"
        }
    }
}
if magazine.contains(blankVowels) && magazine.contains(blankConsonants) {
    print("true")
} else {
    print("false")
}
blankConsonants
blankVowels
//trueCount < note.count

//var count1 = sampleQ6.0.count
//var trueCount = 0
//var count2 = sampleQ6.1.count
//var falseCount = 0
//for x in sampleQ6.0 {
//    for y in sampleQ6.1 {
//        if x != y {
//        falseCount += 1
//        }
//        }
//    }
//if falseCount <= count1 {
//    print("false")
//} else {
//    print("true")
//}
//falseCount
//trueCount

//var myStrings = "abc"
//for character in myStrings {
//    for _ in 0...2 {
//        print(character, terminator:"")
//    }
//}

//var range = 1...10
//for a in range {
//    print("\(a)", terminator: " ")
//}



