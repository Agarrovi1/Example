import UIKit

//1/23/2020

let dataString = """
{"someKey":"a word encoded to data"}
"""
let data = dataString.data(using: .utf8) ?? Data()
data

//How in the past have we decoded this data object?
//Use the JsonDecoder method -> we specify the model that we've defined
//say that "the decoder should try to decode some data object given the format defined in that type's definition"
struct BasicObject: Codable {
    //decoding data using this struct's definition (BasicObject.self) will automatically try to find the key in the json called "someKey" and assign its value to this property
    let someKey: String
}
//to use decoder here, my object whose type i'll be using must conform to Codable
//Codable is a typealias for Decodable and Encodable

//first argument called "type" ->

//what is .self here? it's a property of an object, specifically what kind though?
//.self is a static property of a type
let decodedData = try? JSONDecoder().decode(BasicObject.self, from: data)
decodedData?.someKey

//The old ways: JSON Serialization
//Before codable, we couldn't directly look at the blueprint for a specific type (ex: BasicObject.self).

//Instead, we used a process called serialization
//we had to work with JSON in the way that we've been describing it: [String:Any] or [[String:Any]]

//What these have in common is that you have to define how an object will get its values
//If i define objects, (create a model), I still have to make explicit whitch properties I'm going to use from JSON
//We're still turning JSON into a Swift object, but now we have to do the hard work of looking in a dictionary and getting the values for specific keys

//In swift, when we look up a value in a dictionaty using a key, what is the return type? Optional!
//To serialize JSON data into a Swift object, we're gonna have to use a whole bunch of downcasting

//We start with [String:Any]
//For each property we want to use, we then have make sure that we're casting the Any value the type of the property in our object's definition

//Remember Firebase? How did we initialize objects when we looked at a collection in Firebase and tried to turn the data from that collection into Swift stuff?

//this is an array of json objects, so we'll need to get an array of dictionaries to turn into BiggerObjects
let biggerObjectString = """
[{"name":"istishna","greatness":10},{"name":"iram","greatness":9},{"name":"tia","greatness":"11"}, {}, {"name":"something else that won't work"}]
"""

struct BiggerObject: Codable {
    let name: String
    let title: String
    var greatness: Int {
        return _greatness.value
    }
    
    //underscore is indicating that this property should not be available outside of the current scope. it should be private. It shouldn't be exposed to anyone using your classes/struct. It's solely here to be used by this object.
    //Here, should not allow anyone using an instance of this object to be able to look at the property someBiggerObject._greatness.
    //We'll look at this to provied the value for a computed property.
    private let _greatness: Greatness
    
    struct Greatness: Codable {
        enum GreatnessError: Error {
            case decodingError
        }
        
        let value: Int
        init(int: Int) {
            value = int
        }
        
        init(decoder: Decoder) throws {
            let greatness: Int
            if let greatnessInt = try? decoder.singleValueContainer().decode(Int.self) {
                greatness = greatnessInt
            } else if let greatnessString = try? decoder.singleValueContainer().decode(String.self), let greatnessInt = Int(greatnessString) {
                greatness = greatnessInt
            } else {
                throw GreatnessError.decodingError
            }
            self.value = greatness
            //if its an init, initialize value
            //else if it's a string, try to cast is and initialize that value as an int
            //else, throw an error :(
        }
    }
    
    //Failing init
    //what does this do? -> it can initialize an object, but it's allowed to fail and return nil
    init?(from dict: [String: Any]) {
        guard let name = dict["name"] as? String else {
            return nil
        }
        let title = dict["title"] as? String
        if let greatness = dict["greatness"] as? Int {
            self._greatness = Greatness.init(int: greatness)
        } else if let greatnessString = dict["greatness"] as? String, let greatness = Int(greatnessString) {
            self._greatness = Greatness.init(int: greatness)
        } else {
            return nil
        }
        self.name = name
        self.title = title ?? "N/A"
    }
}

//if we have an array of things, how can we look through each and make sure that we're only keeping the non-nil elements?
//compactMap {it's a map that tries to do some stuff, but gets rid of the nils when that stuff doesn't work)

//utf8, 8 refers to the bits
//most US/Latin characters are represented in utf8, one byte
//chinese characters (because they're a composite of many characters in an extended grapheme cluster) are represented in utf16

let objectData = biggerObjectString.data(using: .utf8) ?? Data()

//Now we need to go from Any to [String:Any]
let serializedJSON = try? (JSONSerialization.jsonObject(with: objectData, options: []) as? [[String:Any]])!

//now let's go from [[String:Any]] to [biggerObject]
let biggerObjects = serializedJSON?.compactMap { BiggerObject.init(from: $0)
}

biggerObjects


//create a func that returns a function that always adds n to any number
func add(n: Int) -> ((Int) -> Int) {
    return { (num: Int) in
        num + n
    }
}

let addOne = add(n: 1)
addOne(3) //4
