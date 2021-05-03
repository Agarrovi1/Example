//
//  RecipeResults.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation

struct RecipeResults: Codable {
    var results: [Recipe]
    var baseUri: String
    
    static func getRecipeResults(from data: Data) -> RecipeResults? {
        do {
        let recipeResults = try JSONDecoder().decode(RecipeResults.self, from: data)
            return recipeResults
        } catch {
            print(error)
        }
        return nil
    }
}

struct Recipe: Codable {
    var id: Int
    var image: String
    var imageUrls: [String]?
    var readyInMinutes: Int
    var servings: Int
    var title: String
    
    static func getRecipes(from data: Data) -> [Recipe]? {
        do {
        let recipes = try JSONDecoder().decode([Recipe].self, from: data)
            return recipes
        } catch {
            print(error)
        }
        return nil
    }
    
    static func getSingularRecipe(from data: Data) -> Recipe? {
        do {
        let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            return recipe
        } catch {
            print(error)
        }
        return nil
    }
}
