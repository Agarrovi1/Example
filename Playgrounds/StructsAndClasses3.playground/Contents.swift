import UIKit

//Notes
var p = Double()
p = 3.14
var zero = Double.zero
//value of zero for double type
var square = Double.pi
Date()

var array = [1,2,3,4]
array.sort() //sorts the array itself
var sortedArray = array.sorted() //returns a new array that has the sorted values

class IDK {
    let confused: Bool
    let drowsy: String
    var temp: String
    
    init(temp: String, drowsy: String, confused: Bool) {
        self.temp = temp
        self.drowsy = drowsy
        self.confused = confused
        //for each instance gives them different information to each propery when initialized
    }
    func ululate() {
        if self.confused {
            print("I HAVE NO IDEA")
        } else {
            print("I got this.")
        }
    }
    func getWarmer() {
        temp = "really hot"
        //a mutating method which a class is ok with
    }
}

let leviKnows = IDK(temp: "too damn hot", drowsy: "nah i'm good", confused: false)
//info specific to this instance
leviKnows.temp = "cold" //can change bc temp is a variable even though levi is a constant
let istishnaDK = IDK(temp: "content", drowsy: "i could sleep", confused: true)
istishnaDK.ululate()
leviKnows.getWarmer() //just changing the temp in leviKnows
//a constant instance of a class can mutate properties of itself, whereas a constant instance of a struct cannot

struct DavidStruct {
    var david: String
}

class Vehicle {
    var size: Double
    var make: String
    
    init(size: Double, make: String) {
        self.size = size
        self.make = make
    }
    func drive() {
        print("moving")
    }
}
let newVehicle = Vehicle(size: 6.8, make: "Ford")

class Car: Vehicle {
    //inherits size and make
    var wheels = 4
    var numOfPassengers: Int
    
    
    init(size: Double, make: String, numOfPassengers: Int) {
        //when we use properties from super do we have to use super to let it know we're taking properties from it???
        //it doesn't like what you're doing
        //Is it referenceing the superclass of cars?
        self.numOfPassengers = numOfPassengers
        super.init(size: size, make: make)
    }
    func tellMeYourCapacity() {
        print("I can carry \(numOfPassengers)")
    }
    override func drive() {
        print("vroom vroom")
    }
}

let newCar = Car(size: 20.2, make: "Cool Car Co", numOfPassengers: 5)
newVehicle.drive()
newCar.drive()

class AirPlane: Vehicle {
    var wings = 2
    var isFlying: Bool
    var capacity: Int //manufacturer's info
    //v is not stored anywhere in memory just calculated from another variable
    var lieWeTellAboutCapacity: Int {
        get { //getter method
            //return a value of the type int, same type as variable its for
            //if a get is alone(without a set), is called "read-only"
            //cannot change it but its value will change based on variable its referencing
            return capacity - 5
        }
        set {
            //this will update a "stored property"
            //lieWeTellAboutCapacity is a computed property
            capacity = newValue + 5
            //this is for if ex: jetBlue.lieWeTellAboutCapacity = 50
        }
    }
    //what we'll tell consumers
    //getter - how we recive a value (how we get it!)
    //setter - how we give this thing (a variable in our case) a new value
    init(size: Double, make: String, isFlying: Bool, capacity: Int) {
        self.isFlying = isFlying
        self.capacity = capacity
        super.init(size: size, make: make)
    }
    func takeOff() {
        if isFlying == true {
            print("already in air")
        } else {
            print("taking off")
            isFlying = true
        }
    }
    func landing() {
        if isFlying == true {
            print("prepare for landing")
            isFlying = false
        } else {
            print("already grounded")
        }
    }
    override func drive() {
        super.drive() //will print from drive() in vehicle
        print("ajkfbaldbfeufb")
    }
}

let jetBlue = AirPlane(size: 4, make: "747", isFlying: true, capacity: 40)
jetBlue.landing()
jetBlue.isFlying
jetBlue.capacity
jetBlue.lieWeTellAboutCapacity //bases information from somewhere else
jetBlue.lieWeTellAboutCapacity = 500//<-- is newValue
jetBlue.capacity

var newVar = 12
print(newVar) //getter
newVar = 13 //setter
//End Notes

//Structs and Classes Lab 2
//Q1
struct Room {
    let maxOccupancy: Int
    let length: Double
    let width: Double
}

var conferenceRoomOne = Room(maxOccupancy: 30, length: 50.0, width: 50.0)
var conferenceRoomTwo = conferenceRoomOne
conferenceRoomOne = Room(maxOccupancy: 20, length: 30.0, width: 30.0)
print(conferenceRoomOne)
print(conferenceRoomTwo)
//Q2
class Bike {
    var wheelNumber = 2
    var hasBell = false
}

var machBike = Bike()
var acroBike = machBike
machBike.hasBell = true
print(machBike.hasBell)
print(acroBike.hasBell)

//Q3
class Animal {
    var name: String = ""
    var printDescription: Void {
    print("I am an animal named \(name)")
    }
    
    init(name: String) {
        self.name = name
    }
}

class Bird: Animal {
    var canFly: Bool
    
    init(name: String, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name)
    }
    
    override var printDescription: Void {
        if canFly == true {
        print("I am bird named \(name) and I can fly")
        } else {
            print("I am bird named \(name) and I can't fly")
        }
    }
}
var flappyBird = Bird(name: "flappy", canFly: true)

class Robin: Bird {
    override init(name: String, canFly: Bool) {
        super .init(name: "Robin", canFly: canFly)
    }
}
var bird = Robin(name: "a", canFly: true)
print(bird.name)
//Q4

