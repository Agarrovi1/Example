import UIKit

var str = "Hello, playground"

//protocol is like a blueprint. gives structure to other things
//most of the ones we've used are data sources and delegates. Template for us to fill in behaviour and properties
protocol Born {
    var birthdate: Date { get }
    func getAge() -> Int
}

protocol PersonWhoCooks {
    func cook() //void func
}
//we're going to create our own protocols to create our own delegates for our own custom views. ex. collection View cells... we'll want them to delegate some behavior to something else(their delegate)

struct Person: Born {
    var birthdate: Date
    
    func getAge() -> Int {
        //current date - birthdate
        let today = Date()
        print(today.timeIntervalSince(birthdate))
        return Int(today.timeIntervalSince(birthdate))
    }
    
    let name: String
}

let newPerson = Person(birthdate: Date(), name: "Tia")
newPerson.getAge()
struct Child: Born {
    var delegate: PersonWhoCooks?
    
    var birthdate: Date
    
    func getAge() -> Int {
        let today = Date()
        print(today.timeIntervalSince(birthdate))
        return Int(today.timeIntervalSince(birthdate))
    }
    
    
}

//tableView.dataSource = self
//view controller's type isn't UITableViewDataSource, it only conforms to it

struct Chef: PersonWhoCooks {
    func cook() {
        print("eat em up")
    }
}

let chef = Chef()
var child = Child(birthdate: Date())
child.delegate = chef
