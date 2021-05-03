import UIKit

class Bike {
    let wheelNumber = 2
    let wheelWidth = 1.3
    var hasBell = true
    func ringBell() {
        if hasBell {
            print("Ring!")
        }
    }
}

class LoudBike: Bike {
    override func ringBell() {
        print("RING!")
    }
    func ringsBell(times: Int) {
        for _ in 1...times {
            ringBell()
        }
    }
}

var loudAssBike = LoudBike()
//loudAssBike.ringBell()
loudAssBike.ringsBell(times: 3)

//Q6
//let horizontalDistance = pointOneXValue - pointTwoXValue
//let verticalDistance = pointOneYValue - pointTwoYValue
//let distanceBetweenTwoPoints = sqrt(horizontalDistance * horizontalDistance + verticalDistance * verticalDistance)

//a. Given the Point object below, complete the `distance` method so that it returns the distance between a given point.

struct Point {
    let x: Double
    let y: Double
    func distance(to point: Point) -> Double {
        let horizontal = self.x - point.x
        let vertical = self.y - point.y
        return sqrt(horizontal * horizontal + vertical * vertical)
    }
}

//let pointOne = Point(x: 0, y: 0)
//let pointTwo = Point(x: 10, y: 10)
//
//print(pointOne.distance(to: pointTwo)) //Prints 14.142135623730951

//b. Given the above Point object, and Circle object below, add a `contains` method that returns whether or not a given point is on the circle
struct Circle {
    let radius: Double
    let center: Point
    func contains(_ point: Point) -> Bool {
        return center.distance(to: point) == radius
    }
    //c. Add another method to `Circle` that returns a random point on the circle
    func getRandomPoint() -> Point {
        
        let x: Double = Double.random(in: (0-radius)...radius)
        let y: Double = sqrt((radius * radius) - (x * x))
        return Point(x: x, y: y)
        //√(r^2) - (x^2)
        
    }
}
let pointOne = Point(x: 0, y: 0)

let circleOne = Circle(radius: 5, center: pointOne)
let pointTwo = Point(x: 5, y: 0)
let pointThree = Point(x: 4, y: 0)
let pointFour = Point(x: sqrt(12.5), y: sqrt(12.5))

circleOne.contains(pointTwo) //true
circleOne.contains(pointThree) // false
circleOne.contains(pointFour) //true

//c. Add another method to `Circle` that returns a random point on the circle

//Hint: Given the radius of a circle and the x value of a point on the circle, the y value of the point is defined by:

//√(r^2) - (x^2)
circleOne.contains(circleOne.getRandomPoint()) //Should always be true

//Q7


//Calculator Project
func parseInput() -> [String]? {
    print("Enter your operation")
    let input = readLine()
    if let validInput = input {
        let inputArray = validInput.components(separatedBy: " ")
        if inputArray.count == 3 {
            return inputArray
        } else {
            return nil
        }
    }
    return nil
}

func doMath() {
    let input = parseInput()
    if let putput = input {
        
    }
}

//how to use the operation dictionary
//if let op = input[1]
//if let operation = operations[op]
//closure(Double,Double)

func add(firstNum x: Int, secondNum y: Int) -> Int {
    return x + y
}
//its type is a function that take in two nums and return a num
let add2: (Int,Int) -> Int = {(firstNum,secondNum) -> Int in
    return firstNum + secondNum
}
//one good thing about closures is that you can make it shorter
let add3: (Int,Int) -> Int = {(x,y) in return x + y}
let add4: (Int,Int) -> Int = {$0 + $1}

func sayHi(andThenRunClosure closure: () -> Void) {
    print("Hi")
    closure()
}

var hiCounter = 0
sayHi {hiCounter += 1}
print(hiCounter)

let strArr = ["111","1334","2678","7878"]
let numArr = strArr.flatMap{ Int($0)}
print(numArr)

enum BrightnessSetting {
    case off
    case low
    case medium
    case high
}

func describeBrightness(setting: BrightnessSetting) {
    switch setting {
    case .off:
        print("It's pretty dark")
    case .low:
        print("Dim screen")
    case .medium:
        print("Regular screen")
    case .high:
        print("Super bright screen")
    }
}

var arr1 = [Int]()
var arr2 = [1,2,3]
print(arr1 + arr2)

let x = ["X","X","X"]
let sample = ["","",""]
x == sample
x == x

let twoX = ["","X","X"]
let diffArrangementOfTwoX = ["X","X",""]

let testString = "  How   about      thesespaces  ?  "


//fizz buzz whiteboard question
extension Int {
    var isFizzy: Bool {
        return self % 3 == 0
    }
    var isBuzzy: Bool {
        return self % 5 == 0
    }

}

func fizzBuzz(range: Range<Int>) {
    for i in range {
        var endString = ""
        if i.isFizzy {
            endString += "Fizz"
        }
        if i.isBuzzy {
            endString += "Buzz"
        }
        
        if endString != "" {
            print(endString)
        } else {
            print(i)
        }
    }
}



var arr = [4]

arr.count > 0 ? true: false

var four: Int? = 4
var numFour: Int? = 4
four == numFour

var string: String? = ""

func any() -> Bool {
    if 1 == 1 {
        return true
    }
    if 2 == 2 {
        print("second if")
    }
}

var arrOfInts = [77,25].map {return "\($0)"}
let ex = arrOfInts.joined(separator: ",")

var stringEx = "ahgb!!!!!abfu"

//print(newEx)
//String.init(repeating: <#T##Character#>, count: <#T##Int#>)
