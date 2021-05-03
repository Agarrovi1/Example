//
//  File.swift
//  EditingTableViewLab
//
//  Created by Angela Garrovillas on 8/18/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct unpuchasedPurchased {
    var unpurchased: [ShoppingItem] = []
    var purchased: [ShoppingItem] = []
    var both: [[ShoppingItem]] {
        return [unpurchased,purchased]
    }
    
}


