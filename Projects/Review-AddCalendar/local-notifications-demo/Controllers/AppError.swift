//
//  AppError.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 11/7/19.
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
    case couldNotRetrieveFromPersistence
    case failedToAddToCalendar
    case eventAlreadyExists
    case other(rawError: Error)
}

