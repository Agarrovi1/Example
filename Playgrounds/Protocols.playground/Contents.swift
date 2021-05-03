import UIKit

//i have a class
//classes can inherit
//ex: ancestor -> predecessor -> lil ol me
//a straight line

//but what if you want to inherit from 2 classes

class Food {
    var calories: Int
    init(calories: Int) {
        self.calories = calories
    }
}

//some seeds aren't food. seed cannot inherit from food, and so we can't create a nice smooth inheritance chain Food -> Seed -> subclass of seed (ex: SunflowerSeed)

class Seed {
    var plantName: String
    init(plantName: String) {
        self.plantName = plantName
    }
}

//i can do two things with a sunflower seed. Olimpia also makes butter.

//class SunflowerSeed: Seed, Food {
//    //cannot inherite from multiple classes
//}

//class SunflowerSeed: Seed {
//    //i could declare this property, but it has no context... i don't know that calories relate to being a food-like thing
//    var calories: Int
//    init(calories: Int, plantName: String) {
//        self.calories = calories
//        super .init(plantName: plantName)
//    }
//}

//let's make it again with protocols

//protocol (keyword) NameOfProtocol (name) {
// var someInt: Int
// var someString: String
// func someFunction() {}
//}

/*
//these ADOPTS the protocol
//class SomeClass: NameOfProtocol, NameOfProtocol2 {
 var someInt: Int = 3 <-- needs to reestablish/ redeclare some properties exactly same form as in the class you want to inherit from
 var someString: String
 
 init(someStirng: String) {
 self.someString = some
 func someFunction() {}
}
//struct SomeStruct: NameOfProtocol, NameOfProtocol2 {}
//enum SomeEnum: NameOfProtocol, NameOfProtocol2 {}

*/

//name tells us what it's job is (loosely)
protocol FullyNamed {
    //properties are computed because the protocol itself doesn't store values
    //in protocal, you only have to say what type of computed values the property will have (read-only or read-write)
    var fullName: String { get set }
}

struct Person: FullyNamed {
//to conform to the protocol, what do i need?
//i will need to implement all properties and methods of that protocol!
    var fullName: String
}

let alyson = Person(fullName: "Alyson Abril")
//alyson.fullName = ""
//can't because full name is a read only value

struct Dog: FullyNamed {
    var barkSound: String
    var fullName: String
}

//protocol Foodlike
//protocol Seedy
//struct SunflowerSeed


//Delegation Pattern
protocol Foodlike {
    var consistency: String { get set }
    var edible: String { get }
    var calories: Int { get set }
    mutating func munch() -> Int //not defined here just makes a template
}

protocol Seedy {
    var plantable: Bool { get }
}

struct SunflowerSeed: Foodlike, Seedy {
    var consistency: String
    var edible: String = "yes"
    var calories: Int
    func munch() -> Int {
        return calories
    }
    
    var plantable: Bool = true
    
}

let sunflower = SunflowerSeed(consistency: "crunchy awesome", edible: "yes", calories: 6, plantable: true)
print(sunflower)
let oneMouthful = sunflower.munch()
print("I just chewed \(oneMouthful) calories of that \(sunflower.consistency) sunflower seed")

//The core purpose of the delegate pattern is to allow an object to communicate back to its owner in a decoupled way. By not requiring an object to know the concrete type of its owner, we can write code that is much easier to reuse and maintain.

//Delegation is usually a good choice when a type needs to be usable in many different context
