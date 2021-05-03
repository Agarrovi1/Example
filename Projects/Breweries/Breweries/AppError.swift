//
//  AppError.swift
//  Breweries
//
//  Created by Angela Garrovillas on 9/5/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
enum AppError: Error {
    case badJSONError
    case networkError
    case noDataError
    case noResponse
    case notFound //404 status code
    case unauthorized //401 and 403
    case badUrl
    case badHTTPResponse
    case badImageData
    case other(rawError: String)//a catch all for any other errors
}
