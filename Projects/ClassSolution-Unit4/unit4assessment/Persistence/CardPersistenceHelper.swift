//
//  CardPersistenceHelper.swift
//  unit4assessment
//
//  Created by David Rifkin on 10/28/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

import Foundation


struct CardPersistenceHelper {
    static let manager = CardPersistenceHelper()
    
    func save(newCard: Card) throws {
        try persistenceHelper.save(newElement: newCard)
    }
    
    func getCards() throws -> [Card] {
        return try persistenceHelper.getObjects()
    }
    
    func deletePhoto(title: String) throws {
        do {
            let cards = try getCards()
            let newCards = cards.filter { $0.cardTitle != title}
            try persistenceHelper.replace(elements: newCards)
        }
    }
    
    
    private let persistenceHelper = PersistenceHelper<Card>(fileName: "cards.plist")
    
    private init() {}
}
