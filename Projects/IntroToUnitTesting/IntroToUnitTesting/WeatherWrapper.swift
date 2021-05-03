//
//  Weather.swift
//  IntroToUnitTesting
//
//  Created by Angela Garrovillas on 8/29/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

struct WeatherWrapper: Codable {
    let message: String
    let list: [List]
    let countChocula: Int
    let callOfDuty: String
    static func getWeather(from data: Data) -> WeatherWrapper {
        do {
        let newWeather = try JSONDecoder().decode(WeatherWrapper.self, from: data)
            return newWeather
        } catch let decodeError {
            fatalError("could not decode info \(decodeError)")
        }
    }
    enum CodingKeys: String, CodingKey {
        //enum thats a dictionary
        //enum must be exhastive and account for every property
        case message = "message"
        case callOfDuty = "cod"
        case countChocula = "count" //if you see count in JSON decode it into struct property countChocula
        case list = "list"
    }
}

struct List: Codable {
    let name: String
    
}
