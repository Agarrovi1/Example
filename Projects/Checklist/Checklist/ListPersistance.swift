//
//  ListPersistance.swift
//  Checklist
//
//  Created by Angela Garrovillas on 10/9/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import Foundation
class ListPersistance {
    private init() {}
    static let manager = ListPersistance()
    private let persistanceHelper = PersistenceHelper<String>.init(fileName: "Items.plist")
    
    func save(new: String) throws {
        try persistanceHelper.save(newElement: new)
    }
    func delete(index: Int) throws {
        var list = try persistanceHelper.getObjects()
        list.remove(at: index)
        try persistanceHelper.replace(arrOfElements: list)
    }
    func getList() throws -> [String] {
        try persistanceHelper.getObjects()
    }
}
