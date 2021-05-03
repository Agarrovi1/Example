//
//  FlashCardInfo.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
struct FlashCardInfo: Codable {
    let cards: [Cards]
}

struct Cards: Codable {
    let id: String
    let cardTitle: String
    let facts: [String]
    
    func makeFactString() -> String {
        var string = ""
        for fact in facts {
            string += "\u{2022}\(fact)\n"
            string += "\n"
        }
        return string
    }
}


