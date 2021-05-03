//
//  sortByGenre.swift
//  WarmUpMovies
//
//  Created by Angela Garrovillas on 8/9/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
func sortByGenre(arr: [Movie]) -> [Movie] {
    let newArr = arr
    return newArr.sorted(by: {(a,b) in return a.genre < b.genre})
}
