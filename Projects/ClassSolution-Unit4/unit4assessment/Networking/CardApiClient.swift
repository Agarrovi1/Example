//
//  CardApiClient.swift
//  unit4assessment
//
//  Created by David Rifkin on 10/28/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

class CardsApiClient {
    static let shared = CardsApiClient()
    
    func getCardData(completionHandler:@escaping(Result<[Card],AppError>)-> Void) {
        
        
        NetworkHelper.manager.performDataTask(withUrl: cardURL, andMethod: .get) { (results) in
            switch results {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {  let cardData = try Card.decodeCardsFromData(from: data)
                    completionHandler(.success(cardData))
                } catch {
                    completionHandler(.failure(.badURL))
                }
            }
        }
    }
    
    private var cardURL: URL {
        guard let url = URL(string: "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards") else {
            fatalError("Error: Invalid URL")
        }
        return url
    }
        
    private init() {}
}
