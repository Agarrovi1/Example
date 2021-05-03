//
//  CardPersistance.swift
//  unit4assessment
//
//  Created by Angela Garrovillas on 10/24/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
class CardPersistance {
    private init() {}
    static let manager = CardPersistance()
    private let persistanceHelper = PersistenceHelper<Cards>.init(fileName: "ACards.plist")
    
    func save(newElement: Cards) throws {
        try persistanceHelper.save(newElement: newElement)
    }
    func delete(at tag: Int) throws {
        var cards = try persistanceHelper.getObjects()
        cards.remove(at: tag)
        try persistanceHelper.replace(arrOfElements: cards)
    }
    func getObjects() throws -> [Cards] {
        try persistanceHelper.getObjects()
    }
}
