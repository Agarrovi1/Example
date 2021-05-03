//
//  NetworkManager.swift
//  Breweries
//
//  Created by Angela Garrovillas on 9/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    //uses let bc dont want anyone else to change it
    //TODO: - we'll update this to cache
    private init() {}
    static let shared = NetworkManager()
    
    
    //Performs GET requests for any URL
    //Parameters: URL as a string
    //Completion: Result with Data in Success, AppError in Failure
    func fetchData(urlStr: String,completionHandler: @escaping (Result<Data,AppError>)->()) {
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(.networkError))
                return
            }
            guard let data = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completionHandler(.failure(.badHTTPResponse))
                return
            }
            switch response.statusCode {
            case 404:
                completionHandler(.failure(.notFound))
            case 401:
                completionHandler(.failure(.unauthorized))
            case 403:
                completionHandler(.failure(.unauthorized))
            case 200...299:
                completionHandler(.success(data))
            default:
                completionHandler(.failure(.other(rawError: "Wrong Status Code")))
            }
        }.resume()
    }
}
