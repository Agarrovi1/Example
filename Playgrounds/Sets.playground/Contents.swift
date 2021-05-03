import UIKit

var anArray = ["string"]
var aDifferentArray: [String]
//^ is not initialized/ does not have a value yet
var aThirdArray = [String]()
//() is initializing thirdArray/ it makes an empty array of strings
//() can initialize an empty thing
//thirdArray did not have to specifically type annotate it like in lines 3 and 4



//Sets
//Another Data Type!
//Collection of information that has no keys and is unordered
//Used it to get rid of duplicates in an array
//Can't have duplicates = no way to look things up
//Values must be unique, but we can iterate through
//in the same way that dictionary's keys must be unique as well


//var set: Set<AnyTypeYouWant>


var uniqueNames: Set<String> = ["eric", "eric", "eric", "david"]
print(uniqueNames)
uniqueNames.insert("samantha")
print(uniqueNames)
var randomArray = [1,2,3,4,4,6]
var setOfRandom = Set(randomArray)
var backToArray = Array(setOfRandom)

var dictionary = ["name":"david","age":"30","mood":"deeeece","ageTomorrow":"30"]
//cannot turn a dictionary into a set
var davidAsSet = Set(dictionary.values)
var someOtherSet: Set<String> = ["name","30","david","ageTomorrow"]
let union = davidAsSet.union(someOtherSet)
print(union)

let set1: Set<Int> = [1,3,56,42,13]
let set2: Set<Int> = [1,2,3,4,5,6,13]
print(set1.union(set2))
//union combines all elements and does not have duplicates

print(union.sorted())
print(set1.symmetricDifference(set2))
//difference = union minus intersection
//prints a different data type

var a: Set<Int> = [1,2,3]
var b: Set<Int> = [1,2,3]
print(a.isSubset(of: b))

//set, superset, subset
//subset --> is contained in another set
//or derived from the original set

//superset is the opposite
union.isSubset(of: union)

//subset belongs to its superset
//they are inverses of each other

//a dog in my pocket. what could its superset(s) be?
//things in my pocket

var thingsThatAreUncomfortable: Set<String> = ["dog","ian","bee","phil","eric","michelle"]
var dog: Set<String> = ["dog"]
//Set Lab
//Q1
var treeHeights = [161, 182, 161, 154, 176, 170, 167, 171, 170, 174]

var sum = 0
for a in treeHeights {
    sum += a
}

var average = sum / treeHeights.count

var treeSet = Set(treeHeights)
print(treeSet)

//Q2
var alphabet = "abcdefghijklmnopqrstuvwxyz"
var alphabetArray = String()
for a in alphabet {
    alphabetArray.append(a)
}

var alphaSet = Set(alphabetArray)

var sentence = "The quick brown fox jumps over the lazy dog"
var sentenceSet: Set<Character> = []
for a in sentence {
    if a != " " {
    sentenceSet.insert(a)
    }
}

if alphaSet.isSubset(of: sentenceSet) {
print("This is a pangram")
} else {
    print("This is not a pangram")
}

//Q3
var nums = [1,2,2,4]
var numSet = Set(nums)
var missingNo: [Int] = []

for a in numSet {
    var count = 0
    for b in nums {
        if a == b {
            count += 1
        }
    }
    if count > 1 {
        missingNo.append(a)
    }
}

for a in 1...nums.count {
    if !numSet.contains(a) {
        missingNo.append(a)
    }
}
print(missingNo)


//Q4
let arr1 = [2, 4, 5, 6, 8, 10, 12]
let arr2 = [1, 2, 3, 4, 5, 6]
let arr3 = [5, 6, 7, 8, 9, 10, 11, 12]
let arr4 = [1, 3, 4, 5, 6, 7, 9]

var allArr = [arr1,arr2,arr3,arr4]

var answerArray: [Int] = []
//using sets
var setArray: Set<Int> = []
for a in allArr {
    let set = Set(a)
    setArray = setArray.union(set)
    //OR
    //setArray = Set(i).union(setArray)
}
answerArray = Array(setArray)
print(answerArray.sorted())
//OR
//print(setArray.sorted())

//using arrays
for a in allArr {
    for b in a {
        if !answerArray.contains(b) {
            answerArray.append(b)
        }
    }
}
print(answerArray.sorted())

//Q5
let list1: Set = [1, 3, 4, 6, 2, 7, 9]
let list2: Set = [3, 7, 13, 10, 4]

//Q5 1
print(list1.intersection(list2)) //[7,4,3]

//Q5 2
print(list1.symmetricDifference(list2))//[6,10,9,1,2,13]

//Q5 3
print(list1.union(list2)) //[1,7,6,10,3,4,2,9,13]

//Q5 4
print(list1.subtracting(list2)) //[9,6,1,2]

//Q6


