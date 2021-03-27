import UIKit

var str = "Hello, playground"

class Person {
    var name: String
    init(name: String) {
        self.name = name
        print("initialialized person \(self.name)")
    }
    deinit {
        print("Deinitializing person \(self.name)")
    }
}
var favoritePerson: Person?
favoritePerson = Person(name: "Otis Redenbacher") //strong reference , this is the thing initialized in person and "favoritePerson" points to it in memory
weak var newPerson = favoritePerson //because we added new reference for otis line 18 does not deinitializes
favoritePerson = nil //otis was deinitialized if favoritPerson was the only reference
print(favoritePerson)
favoritePerson = newPerson
print(favoritePerson)




//weak var weakPerson = favoritePerson //weak reference
//unowned var unownedPerson = favoritePerson
