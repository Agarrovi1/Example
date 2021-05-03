//
//  CartInfo.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation

struct CartInfo: Codable {
    var recipeIdToCount: [Int:Int]
}

//struct RecipeInCart: Decodable {
//    var id: Int
//    var count: Int
//}
