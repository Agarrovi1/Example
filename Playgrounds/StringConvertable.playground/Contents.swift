import UIKit

var str = "Hello, playground"

struct Something: Comparable, CustomStringConvertible/*,lossLessStringConvertable*/ {
    var description: String {
        get {
            return "my name is \(self.name)"
        } set {
            print("they set something new")
        }
    }
    //var description: String = "this is the description"
    
    var name: String
    static func < (lhs: Something, rhs: Something) -> Bool {
        return lhs.name < rhs.name
        //tells how to compare two of type Something
        //defines how < works for type Something
    }
}

var something1 = Something(name: "David")
var something2 = Something(name: "Tia")
let theComparison = something1 < something2

//let theConverstion = String(something1)
something1
print(something1)
print(something1.name) //can still access the properties
