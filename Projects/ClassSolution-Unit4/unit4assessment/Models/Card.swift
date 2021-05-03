//
//  Card.swift
//  unit4assessment
//
//  Created by David Rifkin on 10/28/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct CardWrapper: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let cardTitle: String
    let facts: [String]
    
    
    static func existsInFavorites(title: String) -> Bool {
        do {
            let allFavorites = try CardPersistenceHelper.manager.getCards()
            return allFavorites.contains(where: {$0.cardTitle == title})
        } catch {
            return false
        }
    }
    
    static func getFilteredResults(arr:[Card], searchText: String) -> [Card] {
          var currentFilter: [Card]
        currentFilter = arr.filter{$0.cardTitle.lowercased().contains(searchText.lowercased())}
          return currentFilter
      }
    
static func decodeCardsFromData(from jsonData: Data) throws -> [Card] {
           let response = try JSONDecoder().decode(CardWrapper.self, from: jsonData)
        return response.cards
       }
}
