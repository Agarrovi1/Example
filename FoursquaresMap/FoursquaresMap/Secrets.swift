//
//  Secrets.swift
//  FoursquaresMap
//
//  Created by Angela Garrovillas on 11/4/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Secrets {
    private static let clientID = "OQTQ2M3YWTFPDCYXOPWYRMZJX5A2HOCPXUQ4BFBY2FX5WDPG"
    private static let clientSecret = "N3IO0F0PUKDJNKFZTYZVNET20MQS50MDZ5HFS1F4TWQIQDGV"
    static func makeUrlString(lat: Double,long: Double, query: String) -> String {
        return "https://api.foursquare.com/v2/venues/search?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)&query=\(query.lowercased())&ll=\(lat),\(long)&v=20191106"
    }
    static func makePhotoUrlString(id: String) -> String {
        return "https://api.foursquare.com/v2/venues/\(id)/photos?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)&v=20191106"
    }
}
