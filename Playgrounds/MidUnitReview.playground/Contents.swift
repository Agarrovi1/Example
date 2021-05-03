import UIKit

//Arrays Q3
//Given an array of type [Int], return its sum
//Input: [1,5,2,4,1,4]
//
//Output: 17

//var numbers = [1,5,2,4,1,4]
//var sum = Int()
//
//for nums in numbers {
//    sum += nums
//}
//print(sum)
//

//Arrays 4
//**Given an array of type [Double], return its average**
//
//Input: `[3,4.5,7.5,2,1]`
//
//Output: `3.6`
//var numbers: [Double] = [3,4.5,7.5,2,1]
//var average = Double()
//for nums in numbers {
//    average += nums / Double(numbers.count)
//}
//print(average)

//Array5
//**Given an array of type [Double] and a Double, return the sum of all numbers in the array greater than a given number**
//
//Input: `[3,4.5,7.5,2,1], 3`
//
//Output: `12`
//var numbers: [Double] = [3,4.5,7.5,2,1]
//var greaterThanThisNumber: Double = 3
//var sum = Double()
//for nums in numbers {
//    if nums > greaterThanThisNumber {
//        sum += nums
//    }
//}
//print(sum)

//Array6
//**Given an array of type [Double], return the product of all the elements**
//
//Input: `[3,4.5,7.5,2,1]`
//
//Output: `202.5`

//var numNums: [Double] = [3,4.5,7.5,2,1]
//var product = Double()
//
//for nums in numNums {
//    if product == 0.0 {
//        product += 1.0
//    }
//    product *= nums
//}
//print(product)

//Array7
//**Given an array of type [Int], return the second smallest value in the array**
//
//Input: `[3,6,1,9,4,8]`
//
//Output: `3`

//var numbers = [3,6,1,9,4,8]
//numbers.sorted()
//print(numbers.sorted()[1])

//Optionals 1
//. **Given an array of type [String?] return an array of [String] removing all nil values**
//
//Input: `[nil, "We", "come", nil, "in", "peace"]`
//
//Output: `["We", "come", "in", "peace"]`
//var string = [nil, "We", "come", nil, "in", "peace"]
//var unwrappedString: [String] = []
//
//for words in string {
//    if let word = words {
//        unwrappedString.append(word)
//    }
//}
//print(unwrappedString)


let string: [String?]? = nil
//Optional 4
//**Given an array of type [Int?]? return the sum of all non-nil values.  Use guard statements in your solution.**
//
//Input: `nil`
//
//Output: `0`
//var arrayOfInts: [Int?]? = nil
//var sum = Int()
//
//if let _ = arrayOfInts {
//    for ints in arrayOfInts! {
//        guard ints != nil else {
//            continue
//        }
//        sum += ints!
//    }
//}
//print(sum)


//guard arrayOfInts == nil else {
//    for ints in arrayOfInts! {
//        guard ints != nil else {
//            continue
//        }
//        sum += ints!
//    }
//}

//5. **Given an array of type [Int?] and an optional Int, return the sum of all values not equal to the given number.  If the given number is nil, return the sum of all non-nil values.**
//
//Input: `[1, 1, nil, 3, 5, nil, 1, nil, 3, 5, nil, 5, nil, 3], 1`
//
//Output: `24`

//var array = [1, 1, nil, 3, 5, nil, 1, nil, 3, 5, nil, 5, nil, 3]
//var optionalInt: Int? = 1
//var realInt = Int()
//var sum = Int()
//if let unwrapped = optionalInt {
//    realInt += unwrapped
//}
//for ints in array {
//    if let int = ints, int != realInt {
//        sum += int
//    }
//}
//print(sum)


//1. **Given an array of type [String], return a copy of the array with all duplicate values removed**
//
//Input: `["apple", "apple", "banana", "banana", "banana", "cake", "cake"]`
//
//Output: `["apple", "banana", "cake"]`
//var fruits: [Int:String] = [1:"apple", 2:"apple", 3:"banana", 4:"banana", 5:"banana", 6:"cake", 7:"cake"]
//var output: [String] = []
//for value in fruits.values {
//    if output.contains(value) {
//        continue
//    } else {
//        output.append(value)
//    }
//}
//print(output)
//**Given a String, find the most frequently occurring letter**
//
//Input: `Never trust a computer you can't throw out a window ~ Steve Wozniak`
//
//Output: `t`
//var sentence = "Never trust a computer you can't throw out a window ~ Steve Wozniak"
//var lettersToFrequence: [Character:Int] = [:]
//sentence = sentence.replacingOccurrences(of: " ", with: "")
//for character in sentence.lowercased() {
//    var count = Int()
//    for frequency in sentence.lowercased() {
//        if frequency == character {
//            count += 1
//        }
//    }
//    lettersToFrequence[character] = count
//}
//print(lettersToFrequence)
//var chara = ""
//var mostFrequent = Int()
//for (key,value) in lettersToFrequence {
//    if value > mostFrequent {
//        mostFrequent = value
//        chara = "\(key)"
//    }
//}
//print(chara)


//3. **Given an array of type [Int], return a copy of the array that contains only elements that appear at least twice**
//
//Input: `[1,1,2,3,3,3,4,5,6,6,7]`
//
//Output: `[1,3,6]`

//3. **Given an array of type [String], return an array containing all Strings at least 4 characters long**
//
//Input: `["Never", "trust", "a", "computer", "you", "can't", "throw", "out", "a", "window"]`
//
//Output: `["Never", "trust", "computer", "can\'t", "throw", "window"]`
//var input = ["Never", "trust", "a", "computer", "you", "can't", "throw", "out", "a", "window"]
//var output = input.filter({(x) in
//    x.count >= 4
//})
//print(output)

//4. **Given an array of type [String], return a String containing all of the Strings from the array combined and separated by spaces.  Do this first without using the `joined(separator:) method`**
//
//Input: `["Never", "trust", "a", "computer", "you", "can't", "throw", "out", "a", "window"]`
//
//Output: `Never trust a computer you can't throw out a window`
//var input = ["Never", "trust", "a", "computer", "you", "can't", "throw", "out", "a", "window"]
//
//let altogetherNow = input.reduce("", {if $0 == "" {return $1} else {return $0 + " " + $1}})
//print(altogetherNow)
//enum
//enum NumberType {
//    case even
//    case odd
//
//}
//
//var array = [1,2,3,4,5,6]
//var numArray: [Int] = []

//Input: `"Design is not just what it looks like and feels like. Design is how it works", .uppercase`
//
//Output: ``"DESIGN IS NOT JUST WHAT IT LOOKS LIKE AND FEELS LIKE. DESIGN IS HOW IT WORKS"``
//var input = "Design is not just what it looks like and feels like. Design is how it works"
//
//enum StringType {
//    case lowercase
//    case uppercase
//
//    func upperOrLower(string: String) -> String {
//        switch self {
//        case .lowercase:
//            return string.lowercased()
//        case .uppercase:
//            return string.uppercased()
//        }
//    }
//}
//var upper = StringType.uppercase
//print(upper.upperOrLower(string: input))

enum FileStatus: CustomStringConvertible {
    case unsaved
    case saved(numberOfVersions: Int)
    var description: String {
        switch self {
        case .unsaved: return "Unsaved File"
        case let .saved(numberOfVersions): return "File that has been saved \(numberOfVersions) times"
        }
    }
}

var input = [FileStatus.saved(numberOfVersions: 5), FileStatus.saved(numberOfVersions: 3), FileStatus.saved(numberOfVersions: 8)] //4
var newArray: [FileStatus] = []
var output: [String] = []

for a in input {
    switch a {
    case .saved(numberOfVersions: let x):
        if x > 4 {
            newArray.append(a)
        }
    case .unsaved:
        continue
    }
}
print(newArray)
for a in newArray {
    output.append(a.description)
}
print(output)
