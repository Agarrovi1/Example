//
//  PostFavWrapper.swift
//  Podcasts
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct PostFavWrapper: Codable {
    let trackId: Int
    let favoritedBy: String
    let collectionName: String
    let artworkUrl600: String
    init(trackId: Int, collectionName: String, artworkUrl600: String) {
        self.trackId = trackId
        self.collectionName = collectionName
        self.favoritedBy = "Angela G"
        self.artworkUrl600 = artworkUrl600
    }
    
}
