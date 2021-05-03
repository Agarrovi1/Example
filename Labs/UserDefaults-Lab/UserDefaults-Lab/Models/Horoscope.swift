//
//  Horoscope.swift
//  UserDefaults-Lab
//
//  Created by Angela Garrovillas on 9/24/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Horoscope: Codable {
    let sunsign: String
    let horoscope: String
    let meta: Meta
    
    init () {
        sunsign = ""
        horoscope = ""
        meta = Meta(mood: "", keywords: "", intensity: "")
    }
    
    static func getHoroscope(url: URL, completionHandler: @escaping (Result<Horoscope,AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: HTTPMethod.get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                let horoscopeFromJSON = try JSONDecoder().decode(Horoscope.self, from: data)
                completionHandler(.success(horoscopeFromJSON))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}

struct Meta: Codable {
    let mood: String
    let keywords: String
    let intensity: String
}
