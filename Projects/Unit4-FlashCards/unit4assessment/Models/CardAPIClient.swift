//
//  CardAPIHelper.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
class CardAPIClient {
    private init() {}
    static let helper = CardAPIClient()
    
    func getCards(completionHandler: @escaping (Result<[Cards],AppError>) -> ()) {
        let urlString = "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let cards = try JSONDecoder().decode(FlashCardInfo.self, from: data)
                    completionHandler(.success(cards.cards))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
