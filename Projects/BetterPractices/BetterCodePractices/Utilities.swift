//
//  Utilities.swift
//  BetterCodePractices
//
//  Created by Angela Garrovillas on 1/30/20.
//  Copyright © 2020 Olimpia. All rights reserved.
//

import UIKit

class UIUtilities {
    static func styleFilledButton(_ button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.916221559, green: 0.4997501969, blue: 0.5946856141, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHallowButton(_ button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
}
