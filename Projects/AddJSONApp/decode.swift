//
//  decode.swift
//  AddJSONApp
//
//  Created by Angela Garrovillas on 8/27/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
//when decoding try to use structs to just make a copy of the information
enum JSONError: Error {
    case decodingError(Error)
}

struct Episode: Codable {
    //properties need the same name as the key in JSON
    let name: String
    let number: Int
    let runtime: Int
    let summary: String
    let image: ImageWrapper
    //In previous GOTLab we had, static let allEpisodes listed all the episodes of GOT
    static func getEpisodes(from data: Data) throws -> [Episode] {
        //data is looking at json file as bytes of data
        do { let episodes = try JSONDecoder().decode(/*into type of array of episodes*/[Episode].self, from: data)
            return episodes
        } catch {
            throw JSONError.decodingError(error) //needs throws behind return arrow in func signiture
            //fatalError("Couldn't decode: \(error)")
        }
    }
}

struct ImageWrapper: Codable {
    let medium: String
    let original: String
}
