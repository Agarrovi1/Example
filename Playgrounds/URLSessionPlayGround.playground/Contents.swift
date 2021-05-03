import UIKit
import Foundation
var str = "Hello, playground"

struct People: Codable {
    let results: [NameWrapper]
    static func getPerson(from data: Data) -> [NameWrapper]? {
        do {
        let person = try JSONDecoder().decode(People.self, from: data)
            return person.results
        } catch { //catching errors thrown
            print(error)
        }
        return nil
    }
    
}
struct NameWrapper: Codable {
    let name: Name
}
struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

var personJSONData = """
{"name": {"title":"mr","first":"clark","last":"kent"},
"stuff":"other stuff"
}
""".data(using: .utf8)
//personJSONData is an optional
//if let data = personJSONData {
//People.getPerson(from: data)
//}

let randomUserURLString = "https://randomuser.me/api/?results=5"
guard  let url = URL(string: randomUserURLString) else {fatalError()}

//URLSession is a class
//with property 'shared' which itself is a URLSession
//this is the Singleton pattern
var groupOfPeople: [NameWrapper]?

//so u can use it across multiple files
struct PeopleAPIClient { //making our own URLSession
    static let shared = PeopleAPIClient()
    
    enum FetchUserErrors: Error {
        case remoteResponseError
        case noDataError
        case badDecodeError
    }
    //the escaping closure is gonna take the result and return nothing
    func fetchUsers(completionHandler: @escaping (Result<[NameWrapper],Error>)->()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {completionHandler(.failure(FetchUserErrors.remoteResponseError))
                return
            } // check if everything went ok, no error
            guard let data = data else { completionHandler(.failure(FetchUserErrors.noDataError))
                return
            } //check if there is data
            guard let people = People.getPerson(from: data) else { completionHandler(.failure(FetchUserErrors.badDecodeError))
                return //ends the function
            }
            completionHandler(.success(people))
            //groupOfPeople = people
            }.resume()
    }
}
var firstPerson = NameWrapper(name: Name(title: "mr", first: "david", last: "rifkin")) {
    didSet {
        print(firstPerson)
        //the fetchUsers would be considered finished without getting enything because closure is escaping so you need didSet to make sure the data recieved is going to be the new value from the func
    }
}
PeopleAPIClient.shared.fetchUsers { (result) in
    switch result {
    case .failure(let error):
        print(error)
        //i can use as an instance of Error
    case .success(let people):
        if let peep = people.first {
        firstPerson = peep
        }
        //print(people.first)
    }
}
//groupOfPeople
//print(groupOfPeople)
//need to tell it the location of the thing its looking at
//Data is the data retrieved

let array = [1,2,3,4,5,6,7,8,9]
array.reduce(0, +)
