import UIKit

//memberwise initialization
struct GoodQuestion { //in this block is called a definition
    var text = "not sure"
    var feelsReadyForThisMorning = false
}
//if an instance of a struct is a constant (ie: let) becomes static so cannot change its properties

let newQuestion = GoodQuestion(text: "what's going on", feelsReadyForThisMorning: false)
let strongQuestion = GoodQuestion(text: "what is memberwise initalization?", feelsReadyForThisMorning: true)

//can use default values in initialization
//insantiating - creating an instance
let questioningQuestion = GoodQuestion(text: "Still unsure what's going on", feelsReadyForThisMorning: Bool())
let originalQuestion = GoodQuestion()

//create a superclass for dog that has two propertis and an instance method that Dog will inherit
class Wolf {
    var howl = true
    var speed = "fast"
    var temperment: String
    init(temperment: String) {
        self.temperment = temperment
    }
    func digAHole() {
        print("that's a big hole")
    }
    
}

//convenience init

class Dog: Wolf {
    var legs = 4
    var isFixed = false
    var name: String //has no default value, requires an init
    //private -> shows only convenience init
    //can only be called within the scope of definition
    //designated initializer
    private init(name: String, temperment: String) {
        self.name = name
        super.init(temperment: temperment)
    }
    //convenience initializers
    convenience init(name: String) {
        self.init(name: name, temperment: "Docile")
        //calls the init function and fills some parameters
        //providing values by default
        //the parameters has to be same order as init
    }
}

let myNewPup = Dog(name: "pupper")
print(myNewPup.temperment)
let someWildWolf = Wolf(temperment: "wild")
print("this wolf is \(someWildWolf.speed)")

//1. Designated initializer must call the designated initializer from its superclass
//2. Convenience initializer must call another initializer from the same class (convenience initializer does not itself initialize the instance
//3. Convenience initializer must ultimately call a designated initializer

class Person {
    var name: String
    private var age: Int //private -> this can only be used/reffered to in the scope of this definition
    //a computed property needs to be type annotated
    var ageYouTellPeople: Int {
        get {
            if age > 65 {
                return age - 6
            } else if age < 21 && age >= 17 {
                return 21
            }
            return age
        }
    }
    
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
    func tellYourName() {
        print(name)
    }
}

let iram = Person(name: "Iram Fattah", age: 25)
//iram. does not have access to private age variable
//but can still call ageYouTellPeople
iram.ageYouTellPeople

//create a subclass of president, which has a convenience initializer and overide for tellYourName and a new instance method AND two new properties, one of which is a computed property

//class President: Person {
//    var hobbies: String
//    var vicePres: Bool
//    init(name: String, age: Int, hobbies: String, vicePres: Bool) {
//        self.hobbies = hobbies
//        self.vicePres = vicePres
//        super.init(name: name, age: age)
//    }
//    convenience init(name: String) {
//        self.init(name: name, age: 36, hobbies: "Golf", vicePres: false)
//    }
//    override func tellYourName() {
//        print("My name is \(name) and I am the President")
//    }
//}

class President: Person {
    var twoTerms: Bool
    var numYearsInOffice: Int {
        get {
            return twoTerms ? 8 : 4
        }
    }
    private init(twoTerms: Bool, name: String, age: Int) {
        self.twoTerms = twoTerms
        //self.name = name won't work, need to bring in superclass's properties
        super.init(name: name, age: age)
    }
    convenience init(age: Int, name: String) {
        self.init(twoTerms: false, name: name, age: age)
    }
    override func tellYourName() {
        print("Hi. I am \(name) and I am the president.")
    }
    func tellMeYourAge() {
        print("My age is \(tellMeYourAge())")
    }
}

var newPrez = President(age: 11, name: "The President")
newPrez.tellMeYourAge()

struct Rectangle {
    var width: Int
    var height: Int
    var ratio: Int {
        get {
            return height / width
        }
        set {
            height = width * newValue
        }
    }
    
    init(width: Int) {
        self.height = 13
        self.width = width
    }
    init(width: Int, ratio: Int) {
        self.width = width
        self.height = width/ratio
    }
}

let newRectangle = Rectangle(width: 12, ratio: 1)
let square = Rectangle(width: 2, ratio: 1)
//onve we create init functions for a struct, we no longer have the option to initialize it using memberwise initialization
//can't use this unless we define an init with arguments 'width' and 'height'
//->>>let rec = Rectangle(width: Int, height: Int)

//Lab
struct GPS {
    var latitude = 0.0
    var longitude = 0.0
}
