//
//  PhotoInfo.swift
//  PhotoJournal
//
//  Created by Angela Garrovillas on 10/4/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct PhotoInfo: Codable {
    static var count = 0
    var favorited: Bool
    var imageData: Data
    var summary: String
    let date: Date
    
    init(imageData: Data,summary: String) {
        self.imageData = imageData
        date = Date()
        favorited = false
        self.summary = summary
    }
    func getTimeStamp() -> String {
        let currentDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM-dd-yyyy, h:mm a"
        
        return dateFormatter.string(from: currentDate)
    }
}
