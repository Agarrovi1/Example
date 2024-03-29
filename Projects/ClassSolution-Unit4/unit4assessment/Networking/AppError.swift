//
//  AppError.swift
//  unit4assessment
//
//  Created by David Rifkin on 10/28/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
}
