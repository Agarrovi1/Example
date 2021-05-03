//
//  filter not case sensitive.swift
//  SongsTableViewSearchBar
//
//  Created by Angela Garrovillas on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
func filterSongNameNotCaseSensitive(arrOfSongs: [Song], string: String) -> [Song] {
    return arrOfSongs.filter({$0.name.lowercased().contains(string.lowercased())})
}

func filterArtistNotCaseSensitive(arrOfSongs: [Song], string: String) -> [Song] {
    return arrOfSongs.filter({$0.artist.lowercased().contains(string.lowercased())})
}
