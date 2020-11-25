import UIKit

var str = "Hello, playground"

//Functions
//functions define some behavior that we will want to use. they don't execute that behavior until later on when we call them

func printSomethingAThousandTimes() {
    for _ in 0...1000 {
        print("something")
    }
}

//functions only executes when it is called and after it is defined
printSomethingAThousandTimes()

func printThatThingAboveFiveThousandTimes() {
    printSomethingAThousandTimes()
    printSomethingAThousandTimes()
    printSomethingAThousandTimes()
    printSomethingAThousandTimes()
    printSomethingAThousandTimes()
}
//can put functions inside functions

//inside the () is an argument
//x is going to be an int
//what the code expects x to be
//the x in (x: Int) is a constant
func addTwoToAnIntAndPrintTheResult(x: Int) {
    //but we can make a new variable to make a mutable variable
    let changedX = x + 2
    print(changedX)
}

//needs an -> Type for return command inside the {}
//or it'll be void
func addTwoToAnIntAndReturnTheResult(x: Int) -> Int {
    //but we can make a new variable to make a mutable variable
    let changedX = x + 2
    return changedX
}


addTwoToAnIntAndPrintTheResult(x: 5)
addTwoToAnIntAndReturnTheResult(x: 5) //can treat this as 7
var thisShouldReturnAnInt = addTwoToAnIntAndReturnTheResult(x: 5)
//this variable save the return value that we get from calling this function

func thisReturnsSix() -> Int {
    return 6
}

var thisShouldBeSix = thisReturnsSix()

func weWillAddSomeToAStrings(argument parameter: String) -> String {
    let newString = parameter + "some"
    return newString
}

var w = weWillAddSomeToAStrings(argument: "a string")

func multiplyAnIntTimesThreeAndPrints (x: Int) {
    print(x * 3)
}

func showMeThatThreeTimes() {
    multiplyAnIntTimesThreeAndPrints(x: 1)
    multiplyAnIntTimesThreeAndPrints(x: 1)
    multiplyAnIntTimesThreeAndPrints(x: 1)
}

func reverseAString(s: String) -> String {
    var reverse = ""
    for a in s {
        reverse = "\(a)" + reverse
    }
    return reverse
}
reverseAString(s: "abc")


//Functions Lab
//Q1
let itemCost = 45.0
let nyTax = 0.08775

func totalCostAfterAddingTaxes() -> Int {
    let totalCost = itemCost + (itemCost * nyTax)
    return Int(totalCost)
}

totalCostAfterAddingTaxes()

//Q2

let todaysTemperature = 72
func whatWeatherIsLikeToday (temp: Int) -> String {
    if todaysTemperature <= 40 {
        return "It's cold out."
    } else if todaysTemperature >= 85 {
        return"It's really warm."
    } else {
        return "Weather is moderate."
    }
}

whatWeatherIsLikeToday(temp: todaysTemperature)

//Q3
func min2 (a: Int, b: Int) -> Int {
    if a > b {
        return b
    } else {
        return a
    }
}

min2(a:1, b:2)


//Q4
func lastDigit (_ number: Int) -> Int? {
    let numString = String(number)
    var last: String?

    for a in numString {
        last = "\(a)"
    }
    if let unwrappedNum = last {
        if let intVersion = Int(unwrappedNum) {
            return intVersion
        } else {
            return nil
        }
    } else {
        return nil
    }
}

lastDigit(12345)

//Q5
func theSum (x: Int, y: Int) -> Int {
    return (x + y)
}

theSum(x: 4, y: 9)

//Q6
func letterGrade (numberGrade x: Int) -> String {
    if x == 100 {
        return "A+"
    } else if x >= 90 && x <= 99 {
        return "A"
    } else if x >= 80 && x <= 89 {
        return "B"
    } else if x >= 70 && x <= 79 {
        return "C"
    } else if x >= 65 && x <= 69 {
        return "D"
    } else if x < 65 {
        return "F"
    } else {
        return "not valid grade"
    }
}

//Q7
func calculating (x: Int, y: Int, operation: Character) -> Int? {
    let sum = x + y
    let product = x * y
    let difference = x - y
    let quotient = x / y
    
    if operation == "+" {
        return sum
    } else if operation == "-" {
        return difference
    } else if operation == "*" {
        return product
    } else if operation == "/" {
        if y != 0 {
            return quotient
        } else {
            return nil
        }
    } else {
        return nil
        }
}

calculating(x: 9, y: 3, operation: "/")

//Q8
let mealCost = 45
let tipPercentage = 0.15

func totalWithTip (costOfMeal: Int, tip: Double) -> Double {
    let costAsDouble = Double(costOfMeal)
    let total = costAsDouble + (costAsDouble * tip)
    return total
}

totalWithTip(costOfMeal: mealCost, tip: tipPercentage)

let finalCost = totalWithTip(costOfMeal: 45, tip: 0.15)

let taxPercentage = 0.09
func totalWithTipAndTax(costOfMeal: Int, tip: Double, tax: Double) -> Double {
    let costAsDouble = Double(costOfMeal)
    let total = costAsDouble + (costAsDouble * tip) + (costAsDouble * tax)
    return total
}

let myFinalCostWithTipAndTax =  totalWithTipAndTax(costOfMeal: mealCost, tip: tipPercentage, tax: taxPercentage)

