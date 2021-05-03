import UIKit

var str = "Hello, playground"
protocol Timeable {
    var runtime: Int {get set}
}
class TVSeries: Timeable {
    var runtime: Int
    
    init(runtime: Int) {
        self.runtime = runtime
    }
}

class Channel {
    var name: String
    var currentShow: Timeable?
    var howLongUntilNextShow: Int {
        return currentShow?.runtime ?? 0
    }
    
    init(name: String) {
        self.name = name
    }
}

var gameOfThrones = TVSeries(runtime: 60)
var hbo = Channel(name: "HBO")
hbo.currentShow = gameOfThrones
hbo.howLongUntilNextShow //delegation pattern

class A {
    var a: String
    init(a: String) {
        self.a = a
    }
}

class B {
    
    var a: A
    init(a: A) {
        self.a = a
    }
}

var aA = A(a: "a")
aA.a
var aB = B(a: aA)
aB.a.a
aB.a.a = "c"
aB.a.a
aA.a
