import UIKit

var str = "Hello, playground"

//Optionals

//Declaring an optional
var errorCodeString: String?
errorCodeString = "404"


var temp: Double?
//by default optionals start with nil
//will print nil
print(temp)

//re-assigning --> changing value
temp = 80.5
temp = 30.0
//instead of outputing Optional(80.5) just outputs 80.5

//produces an error
//temp = nil

if temp != nil {
    print(temp)
} else {
    print("the system is broken")
}

var error: Int? = 404
//var name: String?
var optionalInt: Int?
var enrolled: Bool? = true

var firstWord = "alan"
var secondWord = "alex"
var thirdWord: String? = "person"
firstWord = secondWord
print(firstWord)
thirdWord = secondWord
print(thirdWord)


//Unwrapping

//Force Unwrapping
var word: String? = "pizza"
var realWord = word!
print(realWord)
//realWord is String type instead of String? (optional)
var name: String? = "alan"
var lastName = "dafd"
print(name! + lastName)

//Safer way of unwrapping
//Binding
var myPet: String? = "dog"

//start with conditional
//if i can create a true variable out of an optional variable then...
if let unwrappedPet = myPet {
    print(unwrappedPet)
    //unwrapped is not an optional
    //only exist in this bracket
    print(unwrappedPet + "fjkaenfakjnfafnj")
}

var aNilValue: String?
if let aValue = aNilValue {
    print(aValue)
} else {
    print("nothing happened")
}

var myFavoriteFood: String?
myFavoriteFood = "chocolate"
if let favFood = myFavoriteFood {
    print("my favorite food in the world is \(favFood)")
} else {
    //favFood does not exist here
    print("no food")
}

//var myArrayOfOptionals: [Int?/*the inside are optionals*/]?/*this makes the array itself optional*/ = [1,3,5,nil]

var hoursOfOperations: String? = "4:00pm"
var ratings: Int? = 5
//for optional bindings this can only work if the thing after the = is an optional
//nesting
if let unwrappedHours = hoursOfOperations {
    if let unwrappedRatings = ratings {
        print("\(unwrappedHours) + \(unwrappedRatings)")
    }
    print(unwrappedHours)
}
//these are the same ^ and v
//can treat , as and
//but it always reads sequentially
if let unwrappedHours = hoursOfOperations, let unwrappedRatings = ratings {
    print("\(unwrappedHours) + \(unwrappedRatings)")
}

var myOptionalArray: [String] = ["Alan","alex","dog"]
//while let
while let unwrappedName = myOptionalArray.popLast() {
    //unwrappedName = "dog" then "alex" then "Alan"
    //the array loses an element one at a time
    //then becomes nil when its empty
    print(unwrappedName)
}

//for i in 0...2 {
//    print(myOptionalArray.popLast())
//}
//prints out Optional("whatever")

//Guard Statements
//like an inverted if statement
//likely to be used in loops or functions
//the idea is to have one or the other action
guard 1 > 0 else {
    print("we didn't do it")
}
print("we did it")

var myAge: Int?
for i in 0...1 {
guard let unwrappedAge = myAge else {
    print("we didn't do it")
    break
}
    print("we did it")
}

//Nil Coalescing
//useful for default values
var doWeNeedBreak: Bool? = false
var unwrappedBreak = doWeNeedBreak ?? false
print(unwrappedBreak)


var temperature: String?
var temp2: String? = "1"
//var unwrappedTemp = temp2 ?? "30"
if let unwrappedTemp = temp2 {
    if let integerVersion = Int(unwrappedTemp) {
        print(integerVersion + 5)
    }
}

//Lab
//Q1

var userName: String?
//method 1
if userName != nil {
    print(userName!)
} else {
    print("no name")
}
//method 2
if let realUserName = userName {
    print(realUserName)
} else {
    print("no name")
}
//method 3
var realUserName = userName ?? "no name"
print(realUserName)

//Q2
var backgroundColor: String?
//if let color = backgroundColor {
//    print(color)
//} else {
//    backgroundColor = "red"
//}

for _ in 0...1 {
    if let color = backgroundColor {
        print("Background color is \(color)")
    } else {
        backgroundColor = "red"
    }
}

//Q3
var width: Double?
var height: Double?
if let trueWidth = width, let trueHeight = height {
    print("Area is \(trueWidth) * \(trueHeight)")
} else {
    print("no width or height found")
}
