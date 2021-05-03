//
//  APIManager.swift
//  REVIEW-UI
//
//  Created by Angela Garrovillas on 10/10/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import Foundation
final class APIManager {
    //final - cant be changed
    private init() {}
    static let manager = APIManager()
    func getData(completionHandeler: @escaping (Result<[MoreData],AppError>) -> ()) {
        let urlString = "https://api.edamam.com/search?q=chicke&app_id=\(Constants.id)&app_key=\(Constants.key)"
        guard let url = URL(string: urlString) else {
            completionHandeler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withURL: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandeler(.failure(error))
            case .success(let data):
                let recipes = DetailedData.getRecipies(from: data)
                completionHandeler(.success(recipes))
            }
        }
    }
}
