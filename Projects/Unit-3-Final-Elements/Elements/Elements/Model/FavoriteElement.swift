//
//  FavoriteElement.swift
//  Elements
//
//  Created by Angela Garrovillas on 9/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct FavoriteElement: Codable {
    let elementName: String?
    let favoritedBy: String?
    let elementSymbol: String?
    
    init(elementName: String, elementSymbol: String) {
        self.elementName = elementName
        self.favoritedBy = "Angela"
        self.elementSymbol = elementSymbol
    }
    static func getFavorites(url: URL,completionHandler: @escaping (Result<[FavoriteElement],AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: HTTPMethod.get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let dataFromUrl):
                do {
                    let favElements = try JSONDecoder().decode([FavoriteElement].self, from: dataFromUrl)
                    completionHandler(.success(favElements))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
