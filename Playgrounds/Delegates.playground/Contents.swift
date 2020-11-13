import UIKit

//type conforms to a protocol

protocol Cook {
    func makeFood()
}

struct Parent: Cook {
    func makeFood() {
        print("come and get it")
    }
    
}


struct Kid {
    //delegate not really a keyword but how we usually referto this pattern
    var name: String
    var delegate: Cook? //can use protocol as type
}

var olimpia = Parent()
var ermis = Kid(name: "Ermis", delegate: olimpia)
ermis.delegate?.makeFood()
