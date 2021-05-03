//
//  PodcastAPIHelper.swift
//  Podcasts
//
//  Created by Angela Garrovillas on 9/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
class PodcastAPIHelper {
    private init () {}
    static let shared = PodcastAPIHelper()
    func getPodcastWith(search: String, completionHandler: @escaping (Result<[Podcast],AppError>) -> ()) {
        let filteredSearch = search.replacingOccurrences(of: " ", with: "%20").lowercased()
        let urlString = "https://itunes.apple.com/search?media=podcast&limit=200&term=\(filteredSearch)"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        PodcastWrapper.getPodcasts(url: url) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.couldNotParseJSON(rawError: error)))
            case .success(let podcastsFromJSON):
                completionHandler(.success(podcastsFromJSON))
            }
        }
    }
    func postPodcast(fav: [PostFavWrapper], completionHandler: @escaping (Result<Data,AppError>) -> ()) {
        guard let encodedData = try? JSONEncoder().encode(fav) else {
            completionHandler(.failure(.couldNotEncode))
            return
        }
        let urlString = "https://5c2e2a592fffe80014bd6904.mockapi.io/api/v1/favorites"
        guard let postUrl = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: postUrl, andHTTPBody: encodedData, andMethod: HTTPMethod.post) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                completionHandler(.success(data))
            }
        }
    }
}
