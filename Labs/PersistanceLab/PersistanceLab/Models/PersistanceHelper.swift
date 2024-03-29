//
//  PersistanceHelper.swift
//  PersistanceLab
//
//  Created by Angela Garrovillas on 9/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

class PersistenceHelper<T: Codable> {
    func getObjects() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: url.path) else {
            return []
        }
        return try PropertyListDecoder().decode([T].self, from: data)
    }

    func remove(element: T) throws {
        let newUrlPath = url.appendingPathComponent("\(element).txt")
        try FileManager.default.removeItem(at: newUrlPath)
    }
    func save(newElement: T) throws {
        var elements = try getObjects()
        elements.append(newElement)
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }

    init(fileName: String) {
        self.fileName = fileName
    }

    private let fileName: String

    private var url: URL {
        return filePathFromDocumentsDirectory(filename: fileName)
    }

    private func documentsDirectory() -> URL {
       return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
     }

     private func filePathFromDocumentsDirectory(filename: String) -> URL {
       return documentsDirectory().appendingPathComponent(filename)
     }
}

struct PhotoPersistance {
    static let manager = PhotoPersistance()
    
    func save(newPhoto: Photo) throws {
        try persistenceHelper.save(newElement: newPhoto)
    }
    
    func getPhotos() throws -> [Photo] {
        return try persistenceHelper.getObjects()
    }
    
    private let persistenceHelper = PersistenceHelper<Photo>(fileName: "photo.plist")
    
    private init() {}
}
