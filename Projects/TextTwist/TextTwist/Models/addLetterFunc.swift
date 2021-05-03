//
//  addLetterFunc.swift
//  TextTwist
//
//  Created by Angela Garrovillas on 8/6/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation

func addLetterToBank(_ input: String, currentLetterBank: String?) -> String {
    if let unwrap = currentLetterBank, let u = input.last {
    var new = unwrap
        new.append(u)
    return new
    }
    return " "
}
