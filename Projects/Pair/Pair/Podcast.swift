//
//  Podcast.swift
//  Pair
//
//  Created by Angela Garrovillas on 12/1/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation

struct ResultsWrapper: Codable {
    let results: [Podcast]
    
}

struct Podcast: Codable {
    let collectionName: String
    let artworkUrl100: String
    let artworkUrl600: String
    
    
}
