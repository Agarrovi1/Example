//
//  File.swift
//  July30
//
//  Created by Angela Garrovillas on 7/30/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

//model file - where I define a thing that we will increment and get the count of.
struct Counter {
    var count = 0
    mutating func IncCount() {
        self.count += 1
    }
}
