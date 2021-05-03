import UIKit

//Structs and Classes!
//things have properties (we all have two eyes)
//things have behaviors (we all go to the bathroom)

//we are creating a custom type (think of it like a category) and then later we will create instances (particular examples of that category)
//instances of structs/classes - refer to them as "objects"
struct Dog {
    //four legs, wet noses, a tail (unless it's one of those breeds where they clip it...Olimpia disagrees)
    let leg = 4
    let isNoseWet = true
    let tailQuality = "fluffy"
    //^ stored properties
}

var dog1 = Dog()  //new instance
//dog1 is an object
print(dog1)
//properties store information for the instance of the object in the same way that

struct Elephant {
    //these are constants
    let legs = 4
    let trunkLength = "long"
    let ears = "large"
    let averageLifeSpanInYears = 56
    let socialStructure = "matriarchal"
    let males = "bull"
    let female = "cow"
    let hasGoodMemory = true
    var tusk = 2
    //but can make a property that can be changed
    var sizeDescription = "baby-sized"
    
    func paint() -> String {
        return "colors on a canvas"
    }
    func itsHot() -> String {
        return "jump in the pool"
    }
    func trumpet() {
        print("toot toot")
    }
    //mutating is a keyword for an instance method that will change a property on the actual instance we've called it on
    mutating func cutOffTusk() {
        if tusk > 0 {
            tusk -= 1
        }
    }
}
var babar = Elephant()
//^ needs to be var to be changed
print(babar.sizeDescription)
print(babar.hasGoodMemory)
//can reassign a property only if its a variable and the instance is also a variable
babar.sizeDescription = "big boi"
print(babar.sizeDescription)
babar.trumpet()
print(babar.itsHot())
print(babar.paint())
var iansElephant = Elephant()
iansElephant.cutOffTusk()

struct Mammal {
    let liveBirth = true
}
//can export information from mammal to dog

struct DogAnotherExample {
    //we can declare what the properties of a struct should be without giving an initial value
    var name: String? //can be optional
    //like a stray
    let legs = 4
    let isNoseWet = true
    let tailQuality = "fluffy"
    //let's make dog bark
    func bark() {
        print("woof woof, i am \(self.tailQuality)")
        //can interpolate one of its qualities in the function
        //can have self knowledge
    }
    func poop() -> Int {
        return 12943
    }
}
//legs need to be given an initial value when making an new instance
//var exampleDog = DogAnotherExample(name: nil, legs: "4")
var doggie1 = DogAnotherExample(name: "spot")
//similar to type annotation/ argument
//when we go to create a new instance of that construct, we have to provide to it the missing information for the properties that do not have values in the struct's definition

doggie1.name = "fido"
var doggie2 = doggie1
print(doggie2)
doggie2.name = "some other dog name"
//can update one dog without affecting the other
//let dog3 = DogAnotherExample() //name not required because name is optional
//let dog3 = DogAnotherExample(name: "some name")

var dog3 = DogAnotherExample()
//have to unwrap to get name value
dog3.name = "fido"
//print(dog3.name) //Optional("fido")
doggie1.bark()
//structs are value types - something like string, int, other stuff
var a = "a"
var aAgain = a //it makes a copy of var a, and inserts the value of a into that copy
a = "b" //i've updated a
print(aAgain) //keeps its original value


//reference type: sam has a phone number. he gives it to alice.
//reference type: think of this as Bob and Alice both holding on the piece of paper that the phone number is written.
//value type: alice saves her own copy. Bob and alice both have their own unique copy of the phone number,
//if we only look at master on github, we are all ***referring*** to the same place. if we all fork a project from github, we all have our own place to look

struct Classroom {
    let diverse = true
    var temperature = "cold"
    let startTime = "10am"
    var firstPersonToTalkToday: String?
    
    func learning() -> Bool {
        if temperature == "cold" {
            print("can't, it's just too cold")
            return false
        } else {
            print("oh yeah, absolutely")
            return true
        }
    }
}
var july18Class = Classroom(temperature: "cold", firstPersonToTalkToday: "David")
print(july18Class.learning())
july18Class.temperature = "warm"
print(july18Class.learning())



//class are reference types
//class Dog {
//
//}

class SomeClass {
    var property1 = ""
    //mutable, able to be changed
    let property2 = "nope"
    //cannot be changed
    let property3: String
    
    //when you go to create a new instance, you use init.
    //init requires that by the end of the definition of that function,
    //gives a property without a value, some instruction on how itll get one
    init(/*property3: String*/argument parameter: String) {
        property3 = parameter
    }
}


//Lab
//Q1
//these codes will not run because fred and homePlanet are constants and cannot be changed after initializing it

class Giant {
    var name: String
    var weight: Double
    var homePlanet: String
    
    init(name: String, weight: Double, homePlanet: String) {
        self.name = name
        self.weight = weight
        self.homePlanet = homePlanet
    }
}

var fred = Giant(name: "Fred", weight: 340.0, homePlanet: "Earth")

fred.name = "Brick"
fred.weight = 999.2
fred.homePlanet = "Mars"

//Q2
//these codes will not run because bilbo is constants (because of the 'let' keyword and cannot be changed after initializing it

struct Alien {
    var name: String
    var height: Double
    var homePlanet: String
}
var bilbo = Alien(name: "Bilbo", height: 1.67, homePlanet: "Venus")
bilbo.name = "Jake"
bilbo.height = 1.42
bilbo.homePlanet = "Saturn"

//Q3
let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
let jason = edgar
jason.name = "Jason"
print(edgar.name)

//edgar.name will be "Jason" because Giant class is a reference type, both edgar and jason share the same spot in memory and when the .name for jason is changed so is edgar's
//the value of jason.name will also be "Jason"

//Q4
var charles = Alien(name: "Charles", height: 2.25, homePlanet: "Pluto")
var charlesFromJupiter = charles
charlesFromJupiter.homePlanet = "Jupiter"
print(charles.homePlanet)

//the value of charles.homePlanet is "Pluto"
//the value of charlesFromJupiter.homePlanet is "Jupiter"
//this is because the struct Alien is value type, when charlesFromJupiter was initialized it a copy of charles at that moment and is saved in a different spot in memory
//so when charlesFromJupiter is changed it does not affect charles

//Q5
struct BankAccount {
    var owner: String
    var balance: Double
    
    mutating func deposit(_ amount: Double) {
        balance += amount
    }
    
    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

//the code will not work because func itself cannot change a property in that instance
var joeAccount = BankAccount(owner: "Joe", balance: 100.0)
var joeOtherAccount = joeAccount
joeAccount.withdraw(50.0)
print(joeAccount.balance)
print(joeOtherAccount.balance)

//joeAccount.balance is 50 because the joeAccount.withdraw(50.0) called the function and made changes to the balance property for joeAccount
//joeOtherAccount.balance is 100 because that was the value of balance for this account when it was first initialized from joeAccount


//Q6
struct Person {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    func fullName() -> String {
        if let middle = middleName {
            return "\(firstName) \(middle) \(lastName)"
        }
        return "\(firstName) \(lastName)"
    }
}

var parker = Person(firstName: "Peter", middleName: "B", lastName: "Parker")
var morales = Person(firstName: "Miles", middleName: nil, lastName: "Morales")
print(parker.firstName)
print(morales.firstName)

print(parker.fullName())
print(morales.fullName())

//Q7
class Book {
    var title: String
    var author: String
    var rating: Double
    
    init(title: String, author: String, rating: Double) {
        self.title = title
        self.author = author
        self.rating = rating
    }
    
    func isGood() -> Bool {
        if rating >= 7.0 {
            return true
        }
        return false
    }
}

var sophia = Book(title: "Sophia, Princess Among Beasts", author: "James Patterson", rating: 0.0)
var avatar = Book(title: "Rise of Kyoshi", author: "F.C. Lee", rating: 7.0)

