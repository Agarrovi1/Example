import UIKit

var str = "Hello, playground"

//Q7
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var frequency = 0
var noDupes: [Int] = []

for a in numbers {
    if !noDupes.contains(a) {
            noDupes.append(a)
        }
    }

for a in noDupes.sorted() {
    for b in numbers {
        if a == b {
            frequency += 1
        }
    }
    print("\(a) frequency:\(frequency)")
    frequency = 0
}

var myString = "We're flooding people with information. We need to feed it through a processor. A human must turn information into intelligence or knowledge. We've tended to forget that no computer will ever ask a new question."
var alphabet = "abcdefghijklmnopqrstuvwxyz"
var count = 0
var highest = 0
var common = ""
for a in alphabet {
    for b in myString {
        if a == b {
            count += 1
        }
    }
    if count > highest {
        common = "\(a)"
        highest = count
        count = 0
    }
}
  print(common)

//Q9
var numCube: [Int:Int] = [:]
for a in 0...20 {
    numCube[a] = (a * a)
}
print(numCube)

//Q10
let statePop = ["Alabama": 4.8, "Alaska": 0.7, "Arizona": 6.7, "Arkansas": 3.0]
let testStates = ["California","Arizona", "Alabama", "New Mexico"]

for (a, b) in statePop {
    for c in testStates {
        if a == c {
            print(a)
        }
    }
}

//Q11
//Q11a
var deposits: [String: [Double]] = [
    "Williams" : [300.65, 270.45, 24.70, 52.00, 99.99],
    "Cooper" : [200.56, 55.00, 600.78, 305.15, 410.76, 35.00],
    "Davies" : [400.98, 56.98, 300.00],
    "Clark" : [555.23, 45.67, 99.95, 80.76, 56.99, 46.50, 265.70],
    "Johnson" : [12.56, 300.00, 640.50, 255.60, 26.88]
]
var total: [String:Double] = [:]
for (a, b) in deposits {
    var sum = 0.00
    for c in b {
        sum += c
    }
    total[a] = sum
}
print(total)
 var findHighest: [Double] = []
for (_, b) in total {
    findHighest.append(b)
}
for (c, d) in total {
    if d == findHighest.max() {
        print(c)
    }
}
    


//Q11b
var stolenCents: [Double] = []
for (a, b) in total {
    let x = b.truncatingRemainder(dividingBy: 1)
    let y = (x * 100).rounded()/100
    stolenCents.append(y)
    total[a] = b - y
}
print(stolenCents)
var sum = 0.00
for a in stolenCents {
    sum += a
}
print(sum)//3.34

//Q12
myString = "We're flooding people with information. We need to feed it through a processor. A human must turn information into intelligence or knowledge. We've tended to forget that no computer will ever ask a new question."

alphabet = "abcdefghijklmnopqrstuvwxyz"
var alphabetArray:[Character] = []
for a in alphabet {
    alphabetArray.append(a)
}
print(alphabetArray)

var countingLetters: [Int] = []
for a in alphabetArray {
    for b in myString {
        if a == b {
            count += 1
        }
    }
    countingLetters.append(count)
    count = 0
}
print(countingLetters)
var frequencyDict: [Character:Int] = [:]
for a in 0...25 {
    frequencyDict[alphabetArray[a]] = countingLetters[a]
}

print(frequencyDict)

for (a, b) in frequencyDict {
    let second = countingLetters.sorted()[24]
    if b == second {
        print(a)
    }
}

for (a, b) in frequencyDict {
    let max = countingLetters.max()
    if b == max {
        print(a)
    }
}

//Q13
let arr1 = [2, 4, 5, 6, 8, 10, 12]
let arr2 = [1, 2, 3, 4, 5, 6]
let arr3 = [5, 6, 7, 8, 9, 10, 11, 12]
let arr4 = [1, 3, 4, 5, 6, 7, 9]

var withoutDuplicate: [Int] = []
for a in arr1 {
    if !withoutDuplicate.contains(a) {
        withoutDuplicate.append(a)
    }
}

for a in arr2 {
    if !withoutDuplicate.contains(a) {
        withoutDuplicate.append(a)
    }
}

for a in arr3 {
    if !withoutDuplicate.contains(a) {
        withoutDuplicate.append(a)
    }
}

for a in arr4 {
    if !withoutDuplicate.contains(a) {
        withoutDuplicate.append(a)
    }
}
withoutDuplicate = withoutDuplicate.sorted()
print(withoutDuplicate)
var unique: [Int] = []
for a in arr1 {
    
    if arr3.contains(a) && arr2.contains(a) && arr4.contains(a) {
        if !unique.contains(a) {
            unique.append(a)
        }
    }
}
print(unique.sorted())

//Q14
let declarationOfIndependence = """
When in the Course of human events, it becomes necessary for one people to dissolve the
political bands which have connected them with another, and to assume among the powers of the
earth, the separate and equal station to which the Laws of Nature and of Nature's God entitle
them, a decent respect to the opinions of mankind requires that they should declare the causes
which impel them to the separation.

We hold these truths to be self-evident, that all men are created equal, that they are endowed by
their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit
of Happiness. That to secure these rights, Governments are instituted among Men, deriving
their just powers from the consent of the governed, That whenever any Form of Government
becomes destructive of these ends, it is the Right of the People to alter or to abolish it, and to
institute new Government, laying its foundation on such principles and organizing its powers in
such form, as to them shall seem most likely to effect their Safety and Happiness. Prudence,
indeed, will dictate that Governments long established should not be changed for light and
transient causes; and accordingly all experience hath shewn, that mankind are more disposed to
suffer, while evils are sufferable, than to right themselves by abolishing the forms to which they
are accustomed. But when a long train of abuses and usurpations, pursuing invariably the same
Object evinces a design to reduce them under absolute Despotism, it is their right, it is their duty,
to throw off such Government, and to provide new Guards for their future security. Such has
been the patient sufferance of these Colonies; and such is now the necessity which constrains
them to alter their former Systems of Government. The history of the present King of Great
Britain is a history of repeated injuries and usurpations, all having in direct object the
establishment of an absolute Tyranny over these States. To prove this, let Facts be submitted to a
candid world.
"""
var declarationArray: [String] = []
for a in declarationOfIndependence.components(separatedBy: " ") {
    for b in a.components(separatedBy: CharacterSet.punctuationCharacters) {
        declarationArray.append(a)
    }
}
print(declarationArray)
count = 0
var declaraCount: [Int] = []
var declaraDict: [String:Int] = [:]
for a in declarationArray {
    for b in declarationArray {
        if a == b {
            count += 1
        }
    }
    declaraCount.append(count)
    count = 0
}

for a in declarationArray.indices {
    declaraDict[declarationArray[a]] = declaraCount[a]
}

for (a, b) in declaraDict {
    if b == declaraCount.max() {
        print(a)
    }
}
