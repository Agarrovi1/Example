//
//  HoroscopeAPIHelper.swift
//  UserDefaults-Lab
//
//  Created by Angela Garrovillas on 9/24/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
class HoroscopeAPIHelper {
    private init () {}
    static let manager = HoroscopeAPIHelper()
    func getHoroscopeInfo(sunsign: String, completionHandler: @escaping (Result<Horoscope,AppError>) -> ()) {
        let urlString = "http://sandipbgt.com/theastrologer/api/horoscope/\(sunsign)/today"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        Horoscope.getHoroscope(url: url) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let horoscope):
                completionHandler(.success(horoscope))
            }
        }
    }
}
