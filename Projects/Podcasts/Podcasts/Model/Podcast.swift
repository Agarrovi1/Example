//
//  Podcast.swift
//  Podcasts
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct PodcastWrapper: Codable {
    let results: [Podcast]
    
    static func getPodcasts(url: URL, completionHandler: @escaping (Result<[Podcast],AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: HTTPMethod.get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let podcastFromJSON = try JSONDecoder().decode(PodcastWrapper.self, from: data)
                    completionHandler(.success(podcastFromJSON.results))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
}

struct Podcast: Codable {
    let trackId: Int
    let trackName: String
    let trackCount: Int
    let artworkUrl100: String
    let artworkUrl600: String
    let artistName: String
    let collectionName: String
}
