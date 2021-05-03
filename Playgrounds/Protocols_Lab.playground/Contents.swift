import UIKit

protocol FullyNamed {
    var firstName: String { get set }
    var middleName: String? { get set }
    var lastName: String { get set }
    func fullName() -> String
}
struct Person: FullyNamed {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    func fullName() -> String {
        if let mid = middleName {
            return "\(firstName) \(mid) \(lastName)"
        }
        return "\(firstName) \(lastName)"
    }
    
    
}

//Q1
class Human: CustomStringConvertible, Equatable, Comparable {
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    var description: String {
        return "I am \(name) and i am \(age) years old"
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
//a
let crowley = Human(name: "Crowley", age: 30)
let azir = Human(name: "Aziraphael", age: 31)
//b
print(crowley)
print(azir)
//c
print(crowley == azir)
print(crowley != azir)
//d
let diana = Human(name: "Diana", age: 29)
let steve = Human(name: "Steve", age: 27)
let candy = Human(name: "Candy", age: 40)
let arr = [crowley,azir,diana,steve,candy]
let sortedPeople = arr.sorted()
print(sortedPeople)


//Q2
//a
protocol Vehicle {
    var numberOfWheels: Int { get }
    func drive()
}

//b
struct Car: Vehicle {
    var numberOfWheels: Int = 4
    
    func drive() {
        print("Vroom, vroom!")
    }
}
var lamborgini = Car()
print(lamborgini.numberOfWheels)
lamborgini.drive()

//c
struct Bike: Vehicle {
    var numberOfWheels: Int = 2
    
    func drive() {
        print("Begin pedaling!")
    }
}
var onoda = Bike()
print(onoda.numberOfWheels)
onoda.drive()

//Q3
protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

struct Penguin: Bird {
    var name: String
    var canFly: Bool = false
}

struct Eagle: Bird, Flyable {
    var name: String
    var canFly: Bool = true
    
    var airspeedVelocity: Double
}

//Q4
protocol Transformation {
    mutating func transform()
}

enum SuperHero: Transformation {
    case notHulk
    case hulk
    
    mutating func transform() {
        switch self {
        case .notHulk:
            self = .hulk
        case .hulk:
            self = .notHulk
        }
    }
}

var bruceBanner = SuperHero.notHulk
bruceBanner.transform()
bruceBanner.transform()

//Q5
//a,b
protocol Communication {
    var message: String { get }
}
//c,d,e
class Dog: Communication {
    var message: String = "Bark"
}
class Cat: Communication {
    var message: String = "Meow"
}
class Cow: Communication {
    var message: String = "Moo"
}
//f
var dog = Dog()
var cat = Cat()
var cow = Cow()
let animals = [dog.message,cat.message,cow.message]
//g
for a in animals {
    print(a)
}

//Q6
protocol HeartRateRecieverDelegate {
    func heartRateUpdated(toBPM: Int)
}

class HeartRateReceiver {
    var delegate: HeartRateRecieverDelegate?
    var currentHR: Int? {
        didSet {
            if let currentHR = currentHR {
                print("The most recent heart rate reading is \(currentHR).")
                self.delegate?.heartRateUpdated(toBPM: currentHR)
            } else {
                print("Looks like we can't pick up a heart rate.")
            }
        }
    }
    
    func startHeartRateMonitoringExample() {
        for _ in 1...10 {
            let randomHR = 60 + Int.random(in: 0...15)
            currentHR = randomHR
            Thread.sleep(forTimeInterval: 2)
        }
    }
}

class HeartRateViewController: UIViewController, HeartRateRecieverDelegate {
    func heartRateUpdated(toBPM: Int) {
        heartRateLabel.text = "\(toBPM) beats per minute"
        print("The user has been shown a heart rate of \(toBPM)")
    }
    
    var heartRateLabel: UILabel = UILabel()
}

var sampleHeart = HeartRateReceiver()
//sampleHeart.startHeartRateMonitoringExample()
var sampleVC = HeartRateViewController()
sampleHeart.delegate = sampleVC
sampleHeart.startHeartRateMonitoringExample()
