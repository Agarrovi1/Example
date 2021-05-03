//
//  BrewStruct.swift
//  Breweries
//
//  Created by Angela Garrovillas on 9/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Brewery: Codable {
    let id: Int
    let name: String
    let city: String
    let state: String
    static func getBreweries(completionHandler: @escaping (Result<[Brewery],AppError>) -> () ) {
        let url = "https://api.openbrewerydb.org/breweries?by_state=new_york"
        NetworkManager.shared.fetchData(urlStr: url) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let breweries = try JSONDecoder().decode([Brewery].self, from: data)
                    completionHandler(.success(breweries))
                } catch {
                    completionHandler(.failure(.badJSONError))
                }
            }
        }
        
    }
}
