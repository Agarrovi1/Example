//
//  ToDoPersistenceHelper.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 10/29/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct ToDoPersistenceHelper {
    static let manager = ToDoPersistenceHelper()
    
    func save(newToDo: ToDo) throws {
        try persistenceHelper.save(newElement: newToDo)
    }
    
    func getPersistedToDos() throws -> Result<[ToDo],AppError> {
        do {
            let objects = try persistenceHelper.getObjects()
            return .success(objects)
        } catch {
            return .failure(.couldNotRetrieveFromPersistence)
        }
    }
    
    func deleteToDo(title: String) throws -> AppError? {
        do {
            let getResult = try getPersistedToDos()
            switch getResult {
            case .success(let toDos):
                let newToDos = toDos.filter { $0.title != title}
                try persistenceHelper.replace(elements: newToDos)
            case .failure(let error):
                return error
            }
        } catch let error {
            return AppError.other(rawError: error)
        }
        return nil
    }
    
    func isDuplicate(selectedTitle: String) throws -> Result<Bool,AppError>{
        do {
            let getResult = try getPersistedToDos()
            switch getResult {
            case .success(let toDos):
                if toDos.contains(where: { (toDo) -> Bool in
                    toDo.title.lowercased() == selectedTitle.lowercased()
                }){
                    return .success(true)
                }
                return .success(false)
            case .failure:
                return .failure(.couldNotRetrieveFromPersistence)
            }
        } catch (let error) {
            return .failure(.other(rawError: error))
        }

    }
    
    private let persistenceHelper = PersistenceHelper<ToDo>(fileName: "todos.plist")
    
    private init() {}
}
