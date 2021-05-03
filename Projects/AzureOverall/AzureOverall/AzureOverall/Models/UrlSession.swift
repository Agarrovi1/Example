//
//  UrlSession.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation


//MARK: - URLSession
func getDataFrom(url: URL, completionHandler: @escaping (Result<Data,AppError>) -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else {completionHandler(.failure(AppError.other(rawError: error!)))
            return
        }
    guard let unwrappedData = data else { completionHandler(.failure(AppError.noDataReceived))
        return
    }
        completionHandler(.success(unwrappedData))
    }.resume()
}



