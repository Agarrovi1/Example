//
//  APIClient.swift
//  Pair
//
//  Created by Angela Garrovillas on 12/1/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation

struct APIClient {
    func getPodcastData(search: String,completionHandler: @escaping (Result<[Podcast],Error>) -> ())  {
        let search = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "swift"
        let podcastStringURL = "https://itunes.apple.com/search?media=podcast&limit=200&term=\(search)"
        guard let podcastURL = URL(string: podcastStringURL) else {
            print("url error")
            return
        }
        //difference between url and urlRequest
        //url-getting information
        //url-request additional info like posting
        
        let dataTask = URLSession.shared.dataTask(with: podcastURL) { (data, response, error) in
            if let error = error {
                print(error)
                return completionHandler(.failure(error))
            }
            guard let data = data else {
                print("no data")
                return
            }
            do {
                let podcastsResults = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                
                dump(podcastsResults.results)
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
