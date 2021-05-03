//
//  ConcertAPIHelper.swift
//  Concerts
//
//  Created by Angela Garrovillas on 9/6/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
class ConcertAPIHelper {
    private init() {}
    static let shared = ConcertAPIHelper()
    let urlStr = "https://api.seatgeek.com/2/events?type=concert&client_id=MTgyNjU3MTR8MTU2Nzc3ODc0Ni45Mw"
    func getConcerts(completionHandler: @escaping (Result<[Events],AppError>) -> ()) {
        NetworkManager.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                let concertsEvents = try JSONDecoder().decode(Concert.self.self, from: data)
                    completionHandler(.success(concertsEvents.events))
                } catch {
                    completionHandler(.failure(.noDataError))
                }
            }
        }
    }
}
