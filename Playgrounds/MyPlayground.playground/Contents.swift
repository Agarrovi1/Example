import UIKit

var str = "Hello, playground"
var str1 = "Hello, World!"
var ten = 10
var str2 = str1
var str3 = 100000
var str4 = "str"
var array = [1,2,3]
var oddNumbers = 9
var davidsThingsHeCantDraw = ["camels"]
//var davidsThingsHeCantDraw = nil

var boredBoolean = false
var boredString = "false"

var stringNumber = "1"
var numNumber = 1.0
numNumber + 2

var twoString = stringNumber + "1"
var twoNumber = numNumber + 1
var twoInterger = twoNumber
var happy = "😀"
// for emoji, command + control + space

var tipAmount = Double(1)
//changing 1 into a double
var lunchCost = 7.42 + 1
var addTip = lunchCost + tipAmount
// cannot add double (decimal) to an integer
//

var tip1 = 2
var lunch2 = 8.55
lunch2 + Double(tip1)

String(4)
String(5)

var integer = 61
var double = 6.1
var answer = double - Double(integer)

var numberFifty = "50"
var numberSixty = Int(numberFifty)! + 10
// optional is when converting a stringNumber to an integer but comp not sure its an integer
//adding a ! tells comp that it is an int when converting
//there are better ways instead of ! but we'll learn later

//Booleans, Logic, Is it true or false?
var itsTrue: Bool = true
// : Bool --> type annotation = explicitly stating what type of information it is, in this case boolean
//var a: String = "apple"
var itsFalse: Bool = false

var itsGonnaBeTrueOrFalse: Bool
itsGonnaBeTrueOrFalse = true
itsGonnaBeTrueOrFalse = false
//variables can change as opposed to constants

// constants uses --> let
let thisIsFalse: Bool = false

var flies = 0
flies = 1
flies = flies + 1
flies = flies + 100



//Lab 6/25/19
//1. Which data type would be the best to use for recording the total balance of an online shopping cart?
//Double

//2. Which of the following variable declarations is incorrect?
//var b: Char = "A"

//3. Simplify the following using a calculator:
1 + 4 * 2 / 2 + 2

//4. Which of the following are true? State all that apply.
17 % 4 == 1
25 % 4 != 1
81 % 9 != 840 % 2
(14 % 2 < 4) || (243 % 13 > 2) || (52 % 3 > 5)

//5. Which of the follow is true?
let numOne = 4.0
let numTwo = 4.0
let a = numOne == numTwo

//6. What is the final value of i?
var i = 0
i = 5
i += 3
i *= 2
i %= 3
i -= 3
