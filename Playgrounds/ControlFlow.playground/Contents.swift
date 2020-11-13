import UIKit

var str = "Hello, playground"

let projectorWorks = true
let projectorDoesntWork = false
//needs boolean value after the if and before {}
if projectorWorks {
    print("let's do some learning")
}

if projectorDoesntWork {
    print("what's going on")
}

var weatherNice = true
var weatherNotNice = false
var weather = 17

if weather >= 75 {
    print("wear a t-shirt")
} else if weather <= 32 {
    print("wear a coat")
}

var grade = 90

if grade >= 80 {
    print("Good!")
} else if grade < 80 && grade >= 65 {
    print("Mediocre")
} else {
    print("bad")
}
var good = 90
var thingToPrint = grade >= good ? "great job" : "not great job"
// ? --> ternary operator
//declaring a variable based on a condition
// : means if not then...
// ie ? is like if and : is like else


var whatToWear = weather >= 65 ? "wear a shirt" : "wear a sweater"
//value of whatToWear is a string

//switch statement
var medium = 70

switch grade {
    case good:
        print("ya did good")
    case medium:
        print("this was okay but needs improvement")
    default:
        print("not great bob")
}

//var bad = 32
//weather = 90
//switch weather {
//case good...85:
//    print("nice")
//default:
//    print("ugh")
//}
// #...# the three dots make a inclusive range b/w the two numbers
// #..># not inclusive at the end
// take one . and replace with a > or <

//range is a type
var weatherBad = 0...35
var range = 79...100
var anotherRange = Range(0...45)

// switch cases needs a default case
//but there are exceptions

var thisCanBeTwoThings = true
switch thisCanBeTwoThings {
case true:
    print("yup")
case false:
    print("nope")
}

//Lab
//Question 1
let conditionOne = !(4 < 5) || !(3 > 8)
let conditionTwo = !(!true)

if conditionOne {
    print("A")
} else if conditionTwo {
    print("B")
}
if conditionTwo {
    print("C")
}
print("D")

// Question 2
let appInfo = (name: "myCoolApp", version: 0.4)
switch appInfo {
case (_, 0.0..<1.0):
    print("\(appInfo.0) hasn't released yet")
case ("myCoolApp", _):
    print("Thanks for looking at myCoolApp!")
default:
    print("I'm not quite sure what you are looking at")
}

//Question 3
//let x: Int = 4
//switch x {
//case 0..<4:
//    print("A")
//case 5..<10:
//    print("B")
//case is Double:
//    print("C")
//default:
//    print("D")
//}

//Question 4
//let candyType : String = "skittles"
//
//switch candyType {
//case "mAndM":
//    print("Melts in your mouth, not in your hand")
//case "skittles":
//    print("Taste the rainbow")
//case "snickers":
//    print("Hungry? Grab a Snickers")
//}

//Question 5
let currentWeather = "rain"
switch currentWeather {
case "rain":
    print("bring an umbrella")
case "sunny":
    print("wear sunglasses")
case "snow":
    print("wear a coat")
default:
    print("cool")
}

//Question 6
let firstName = "John"
let lastName = "Appleseed"
var fullName = firstName + " " + lastName
print("The Fellow's full name is " + fullName)
// end lab

var todayTemp = 90
var yestTemp = 80
// the type after the switch needs to match the case type too
switch todayTemp < yestTemp {
case true:
    print("it is hotter")
default:
    print("it is cooler")
}

//Tuples
var david = (age: 24,DOB: "December",um: 1.11)
print(david.0)
print(david.age)
//can name the attibute



