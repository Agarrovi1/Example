import UIKit

//Enumeration!!
//name is capitalized like Int,String,Result
//enums are their own type
enum CardinalDirections: String {
    //north,west,east,south
    case north = "North" //situation or cases
    case south = "South"
    case east = "East"
    case west = "West"
}

let c = CardinalDirections.init(rawValue: "North")
print(c)
print(c?.rawValue)
print(CardinalDirections.north)//just the name of the case
print(CardinalDirections.north.rawValue)//the raw value

//Associated Value
//adding more values to each case
//enum CardinalDirections2: (String,String,String) {
//    //north,west,east,south
//    case north(east,north,west)
//    case south()
//    case east(String)
//    case west(String)
//}

//switch statement that prints ("hey you're going in the \(rawvalue) direction")
var theRawType = String()

switch c! { //c is an optional
    //c! == CardinalDirection.north
case .north:
    theRawType = "hey you are going \(CardinalDirections.north.rawValue)"
case .south:
    theRawType = "hey you are going \(CardinalDirections.south.rawValue)"
case .east:
    theRawType = "hey you are going \(CardinalDirections.east.rawValue)"
case .west:
    theRawType = "hey you are going \(CardinalDirections.west.rawValue)"
}
print(theRawType)
//print that line from above and interpolate theRawType

//Lab
//Q1a
enum iOSDeviceType {
    case iPhone(String,String,String)
    case iPad(String,String,String)
    case iWatch
}

var myDevice = iOSDeviceType.iPad

//Q1b

var iPhoneModels = iOSDeviceType.iPhone("4", "5", "6 Plus")
var iPadModels = iOSDeviceType.iPad("Mini", "Pro", "Air")

switch iPhoneModels {
case .iPhone(let model1,let model2 , let model3):
    print("iphone models: \(model1), \(model2), \(model3)")
case .iPad(let model1,let model2 , let model3):
    print("ipad models: \(model1), \(model2), \(model3)")
default:
    print()
}

//Q2a
//enum Shape: String {
//    case triangle
//    case rectangle
//    case square
//    case pentagon
//    case hexagon
//}
//
//func howManySides(a: String) -> Int {
//    switch a {
//    case "triangle":
//        return 3
//    case "rectangle":
//        return 4
//    case "square":
//        return 4
//    case "pentagon":
//        return 5
//    case "hexagon":
//        return 6
//    default:
//        return 0
//    }
//}
//
//var myFavoritePolygon = Shape.square.rawValue
//print(howManySides(a: myFavoritePolygon))

//Q2c
enum Shape {
    case triangle(Int)
    case rectangle(Int)
    case square(Int)
    case pentagon(Int)
    case hexagon(Int)
}

func perimeter(theShape: Shape, length: Int) -> Int {
    switch theShape {
    case .triangle:
        return length * 3
    case .rectangle:
        return length * 6
    case .square:
        return length * 4
    case .pentagon:
        return length * 5
    case .hexagon:
        return length * 6
    }
}

var sampleShape = Shape.triangle(3)

switch sampleShape {
case .triangle(let length):
    print("perimeter is \(length * 3)")
case .rectangle(let length):
    print("perimeter is \(length * 6)")
case .square(let length):
    print("perimeter is \(length * 4)")
case .pentagon(let length):
    print("perimeter is \(length * 5)")
case .hexagon(let length):
    print("perimeter is \(length * 6)")
}

//Q3
enum OperatingSystem: String {
    case windows
    case mac
    case linux
}

var arrayOfTen = [OperatingSystem.windows,OperatingSystem.mac,OperatingSystem.linux,OperatingSystem.linux,OperatingSystem.mac,OperatingSystem.windows,OperatingSystem.mac,OperatingSystem.linux,OperatingSystem.linux,OperatingSystem.mac]
func oSThingy(array: [OperatingSystem]) {
    for a in array {
        switch a {
        case .mac:
            print("mac: the OS of apple products")
        case .linux:
            print("linux: an OS with a penguin?")
        case .windows:
            print("windows: OS with window picture")
        }
    }
}
oSThingy(array: arrayOfTen)

//Q4
enum Direction {
    case up
    case down
    case left
    case right
}
var location = (x: 0, y: 0)
var steps: [Direction] = [.up, .up, .left, .down, .left]
func makingMyWayDownTown(steps: [Direction], location: (Int,Int)) -> (Int,Int) {
    var newLocation = location
    for a in steps {
        switch a {
        case .up:
            newLocation.1 += 1
        case .down:
            newLocation.1 -= 1
        case .left:
            newLocation.0 -= 1
        case .right:
            newLocation.0 += 1
        }
    }
    return newLocation
}
location = makingMyWayDownTown(steps: steps, location: location)
print(location)

//Q5a
enum HandShape {
    case rock
    case paper
    case scissors
}

enum MatchResult {
    case win
    case draw
    case lose
}

func match(playerOne: HandShape,playerTwo: HandShape) -> MatchResult {
    switch true {
    case playerOne == playerTwo:
        return MatchResult.draw
    case playerOne == .paper, playerTwo == .rock:
        return MatchResult.win
    case playerOne == .rock, playerTwo == .scissors:
        return MatchResult.win
    case playerOne == .scissors, playerTwo == .paper:
        return MatchResult.win
    default:
        return MatchResult.lose
    }
}

var p1 = HandShape.paper
var p2 = HandShape.scissors
match(playerOne: p1, playerTwo: p2)
//Q6
//enum CoinType: Int {
//    case penny = 1
//    case nickle = 5
//    case dime = 10
//    case quarter = 25
//}

//var moneyArray:[(Int,CoinType)] = [(10,.penny),
//                                   (15,.nickle),
//                                   (3,.quarter),
//                                   (20,.penny),
//                                   (3,.dime),
//                                   (7,.quarter)]
//
//func totalValueOfChangeInPocket(coins: [(Int,CoinType)]) {
//    var money = 0
//    for a in coins {
//        switch a.1 {
//        case .dime:
//            money += (a.0 * CoinType.dime.rawValue)
//        case .nickle:
//            money += (a.0 * CoinType.nickle.rawValue)
//        case .penny:
//            money += (a.0 * CoinType.penny.rawValue)
//        case .quarter:
//            money += (a.0 * CoinType.quarter.rawValue)
//        }
//    }
//    print("\(money) cents")
//}
//totalValueOfChangeInPocket(coins: moneyArray)

enum CoinType: Int {
    case penny = 100
    case nickle = 20
    case dime = 10
    case quarter = 4
}

let coin = CoinType.nickle
var coinsInDollar = Int()
switch coin {
case .nickle:
    coinsInDollar = CoinType.nickle.rawValue
case .penny:
    coinsInDollar = CoinType.penny.rawValue
case .dime:
    coinsInDollar = CoinType.dime.rawValue
case .quarter:
    coinsInDollar = CoinType.quarter.rawValue
}
print("I need \(coinsInDollar) nickles to make a dollar")

//Q7
enum DayOfWeek: String {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

let poorlyFormattedDays = ["MONDAY", "wednesday", "Sunday", "monday", "Tuesday", "WEDNESDAY", "thursday", "SATURDAY", "tuesday", "FRIDAy", "Wednesday", "Monday", "Friday", "sunday"]

func properFormat(arr: [String]) -> [DayOfWeek] {
    var newArr: [DayOfWeek] = []
    for a in arr {
        switch a.lowercased() {
        case DayOfWeek.Monday.rawValue.lowercased():
            newArr.append(DayOfWeek.Monday)
        case DayOfWeek.Tuesday.rawValue.lowercased():
            newArr.append(DayOfWeek.Tuesday)
        case DayOfWeek.Wednesday.rawValue.lowercased():
            newArr.append(DayOfWeek.Wednesday)
        case DayOfWeek.Thursday.rawValue.lowercased():
            newArr.append(DayOfWeek.Thursday)
        case DayOfWeek.Friday.rawValue.lowercased():
            newArr.append(DayOfWeek.Friday)
        case DayOfWeek.Saturday.rawValue.lowercased():
            newArr.append(DayOfWeek.Saturday)
        case DayOfWeek.Sunday.rawValue.lowercased():
            newArr.append(DayOfWeek.Sunday)
        default:
            newArr.append(DayOfWeek.Monday)
        }
    }
    return newArr
}
var new = properFormat(arr: poorlyFormattedDays)
print(new)

func isWeekend(day: DayOfWeek) -> String {
    switch day {
    case .Saturday:
        return "is weekend"
    case .Sunday:
        return "is weekend"
    default:
        return "is week day"
    }
}
func weekDays(days: [String]) -> Int {
    var count = 0
    let proper = properFormat(arr: days)
    for a in proper{
        switch isWeekend(day: a){
        case "is week day":
            count += 1
        default:
            count += 0
        }
    }
    return count
}

weekDays(days: poorlyFormattedDays)
