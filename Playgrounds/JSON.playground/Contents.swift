import UIKit

var str = "Hello, playground"

let p = ["string":"any value"]
let json = [String:Any]()

//new types conform to codable if their properties are of types that also conform to codable
class Artist: Codable {
    var firstName: String
    var lastName: String
    var debutYear: Int
}

class Song: Codable {
    var title: String
    var artist: Artist //Artists conforms to Codable
    var runtime: Double
    var pitchForRating: Double
}
