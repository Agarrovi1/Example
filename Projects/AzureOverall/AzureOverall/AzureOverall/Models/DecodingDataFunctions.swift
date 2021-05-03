//
//  DecodingDataFunctions.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

func makeStringFrom(arr: [Int]) -> String {
    let arrOfStrings = arr.map {"\($0)"}
    return arrOfStrings.joined(separator: ",")
}

//MARK: - Recipes with search query
func getRecipes(with query: String,completionHandler: @escaping (Result<RecipeResults,AppError>)->()) {
    guard let searchUrl = URL(string: "https://api.spoonacular.com/recipes/search?query=\(query)&number=10&apiKey=\(Secrets.apiKey)") else {
        completionHandler(.failure(.badURL))
        return
    }
    getDataFrom(url: searchUrl) { (urlSessionResults) in
        switch urlSessionResults {
        case .failure(let error):
            completionHandler(.failure(error))
        case .success(let data):
            guard let recipeResults = RecipeResults.getRecipeResults(from: data) else { completionHandler(.failure(AppError.invalidJSONResponse))
                        return
                    }
            completionHandler(.success(recipeResults))
        }
    }
}

//MARK: - Recipes through id
func getRecipeBy(id: Int, completionHandler: @escaping (Result<Recipe,AppError>) ->()) {
    guard let idUrl = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?apiKey=\(Secrets.apiKey)&includeNutrition=false") else {
        completionHandler(.failure(.badURL))
        return
    }
    
    getDataFrom(url: idUrl) { (urlSessionResults) in
        switch urlSessionResults {
        case .failure(let error):
            completionHandler(.failure(error))
        case .success(let data):
            guard let recipe = Recipe.getSingularRecipe(from: data) else { completionHandler(.failure(AppError.invalidJSONResponse))
                        return
                    }
            completionHandler(.success(recipe))
        }
    }
}

//MARK: - Recipe through multiple ids
func getMultipleRecipes(ids: [Int], completionHandler: @escaping (Result<[Recipe],AppError>) ->()) {
    guard ids.count > 0 else {
        completionHandler(.success([]))
        return
    }
    
    let multiIdString = makeStringFrom(arr: ids)
    
    guard let multiIdUrl = URL(string: "https://api.spoonacular.com/recipes/informationBulk?ids=\(multiIdString)&apiKey=\(Secrets.apiKey)&includeNutrition=false") else {
        completionHandler(.failure(.badURL))
        return
    }
    getDataFrom(url: multiIdUrl) { (urlSessionResults) in
        switch urlSessionResults {
        case .failure(let error):
            completionHandler(.failure(error))
        case .success(let data):
            guard let recipes = Recipe.getRecipes(from: data) else { completionHandler(.failure(AppError.invalidJSONResponse))
                        return
                    }
            completionHandler(.success(recipes))
        }
    }
}

//MARK: Images with url

func getImage(withUrlString: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
    guard let url = URL(string: withUrlString) else {
        completionHandler(.failure(.badURL))
        return
    }
    getDataFrom(url: url) { (urlSessionResults) in
        switch urlSessionResults {
        case .failure(let error):
            completionHandler(.failure(error))
        case .success(let data):
            guard let image = UIImage(data: data) else { completionHandler(.failure(AppError.notAnImage))
                        return
                    }
            completionHandler(.success(image))
        }
    }
}
