//
//  Model.swift
//  REVIEW-UI
//
//  Created by Angela Garrovillas on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import Foundation

struct Recepies: Codable {
    var hits: [MoreData]
}

struct MoreData: Codable {
    var recipe: DetailedData
}

struct DetailedData: Codable {
    var label: String
    var image: String
    var source: String
    var ingredientLines: [String]
    var calories: Double
    
    static func getRecipies(from jsonData:Data) -> [MoreData] {
        do {
            let recipeWrapper = try JSONDecoder().decode(Recepies.self, from: jsonData)
            return recipeWrapper.hits
        } catch {
            print(error)
        }
        return [MoreData]()
    }
}
