//
//  Secrets.swift
//  WeatherApp
//
//  Created by Angela Garrovillas on 10/13/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
struct Secrets {
    private static let darkSkyKey = "eed4bfad8b6cff322fc8746b10008d56"
    static func getDarkSkyUrl(lat: String, long: String) -> String {
        return "https://api.darksky.net/forecast/\(Secrets.darkSkyKey)/\(lat),\(long)"
    }
    private static let apiKey = "13796459-1f28e6be7544e57cf485862e5"
    
    static func getPixabayUrlWith(query: String) -> String {
        let query = query.lowercased().replacingOccurrences(of: " ", with: "_")
        return "https://pixabay.com/api/?key=\(self.apiKey)&q=\(query)"
    }
}
