//
//  funcToTakeALetterFromLetterBank.swift
//  TextTwist
//
//  Created by Angela Garrovillas on 8/6/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit

func takeLetterAndReturnLeftoverOfLetterBank(string: String, letterBank: UILabel) -> String {
    if let unwrap = string.last, let unwrapLabel = letterBank.text {
        var label = unwrapLabel
        
        if let i = label.firstIndex(of: unwrap) {
            label.remove(at: i)
            return label
        }
        return label
    }
    return String()
}
