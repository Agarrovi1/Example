//
//  ElementAPIClient.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
class ElementAPIClient {
    private init () {}
    static let manager = ElementAPIClient()
    func getElements(completionHandler: @escaping (Result<[ChemicalElement],AppError>) -> ()) {
        let urlString = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        ChemicalElement.getElements(url: url) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let elementsFromJSON):
                completionHandler(.success(elementsFromJSON))
            }
        }
    }
    func postFavElement(fav: FavoriteElement, completionHandler: @escaping (Result<Data,AppError>) -> ()) {
        let urlString = "https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        guard let encodedData = try? JSONEncoder().encode(fav) else {
            completionHandler(.failure(.couldNotEncode))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andHTTPBody: encodedData, andMethod: HTTPMethod.post) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                completionHandler(.success(data))
            }
        }
    }
    func getFavElements(completionHandler: @escaping (Result<[FavoriteElement],AppError>) -> ()) {
        let urlString = "https://5d83bc5ebaffda001476aa88.mockapi.io/api/v1/favorites"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        FavoriteElement.getFavorites(url: url) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let elementsFromJSON):
                completionHandler(.success(elementsFromJSON))
            }
        }
    }
}
