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
    
}
