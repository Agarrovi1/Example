import UIKit

var str = "Hello, playground"

var fancyNumberName: Int8 = 11
var fancyNumberName1: Int = 11
//var sum = fancyNumberName + fancyNumberName1
// cannot add Int8 and Int types

var sum =  Int(fancyNumberName) + fancyNumberName1

let weather = "sunny"
print (weather)

var itsTrue = true
var itsFalse = false

print (itsTrue == itsFalse)
//cant compare two different types

//different comparison operators
/*
 == is equal to
 != NOT equal to
 < less than
 <= less than or equal to
 > greater than
 >= greater than or equal
 && and
 || or
 */

print ("even" == "odd")
print ("even" == "even")
print (8.1 > 9.6)
print (7.3 != 1.1)
"even" < "odd"
print(true && itsTrue)
print(true && itsTrue && itsFalse)
print(true || itsFalse)
print(true && itsTrue || itsFalse)

let stringComp = "ssmyname" < "sssomebo"
//this is a boolean
print(stringComp)
let numberComp = 1 < 3
print(numberComp)

!true
let nameForConstant = 12/5
// for division, answer loses remainder for Integers
let modulo = 14 % 5

//var q = m++
//increment operator, increases by 1, does not work in swift
var m = 14 % 5
m += 5
//make m larger by 5

m -= 3
m *= 3
m /= 2
m %= 3

//lab2 questions
//question 3
//var a = 12
//var b = 3
//a / b
//a % b
//print("divisible")

//question 4
//var a = 2
//var b = 3
//var c = 2
//if a == b || b == c || a == c {
//print("at least two variables have the same value")
//} else {
//    print("All the values are different")
//}
//question 5
var baconAge = 6
var eggsAge = 12
var baconSpoils = 7
var eggsSpoils = 21
if baconAge > baconSpoils {
    print("throw out bacon")
}
if eggsAge > eggsSpoils {
    print("throw out eggs")
}
if baconAge < baconSpoils && eggsAge < eggsSpoils {
    print("you can cook bacon and eggs")
}



//Question 6
let year = 1900
if year % 400 == 0 {
    print("Leap year!")
} else if year % 100 == 0 {
    print("Not a leap year!")
} else if year % 4 == 0 {
    print("Leap year!")
} else {
    print("Not a leap year")
}



//question 7
let randomNum = Int.random(in:0...100)

let heads = randomNum % 2 == 0
let tails = randomNum % 2 != 0
print(heads)
print(tails)

if randomNum % 2 == 0 {
    print("heads")
} else if randomNum % 2 != 0 {
    print("tails")
}

//question 8
var a = 5
var b = 6
var c = 3
var d = 4
if a < b && a < c && a < d {
    print(a)
} else if b < a && b < c && b < d {
    print(b)
} else if c < a && c < b && c < d {
    print(c)
} else {
    print(d)
}
